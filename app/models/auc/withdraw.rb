# == Schema Information
#
# Table name: withdraws
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  code           :string(255)
#  transferred_at :datetime
#  amount         :decimal(20, 2)
#  state          :string(255)
#  card_number    :string(255)
#  bank_name      :string(255)
#  name           :string(255)
#  mobile         :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  finished_at    :datetime
#  rejected_at    :datetime
#  processing_at  :datetime
#

class Withdraw < ActiveRecord::Base
  include AASM
  # 提供给 helper 的方法, 方便动态生成 progress
  STATE_PROCESS = [:pending, :processing, :transferred, :finished]

  belongs_to :user

  validates_presence_of :code, :amount, :user_id, :card_number, :bank_name, :name, :mobile

  symbolize :state, in: [:pending, :rejected, :processing, :transferred, :finished], default: :pending, scopes: :shallow, methods: true

  scope :month_out, ->{ where("created_at <= #{Time.zone.now - 3.months}") }
  scope :month_in, ->{ where("created_at >= #{Time.zone.now - 3.months}") }

  aasm column: :state do
    state :pending, initial: true # 提交成功          # 资金开始冻结(已经从个人账户中扣除)
    state :rejected               # 审核失败          # 归还
    state :processing             # 客服处理中
    state :transferred            # 转账成功, 待确认
    state :finished               # 已经确认, 完成    # 解除冻结
    
    event :reject, after: [:set_rejected_at, :pay_back] do
      transitions from: :pending, to: :rejected
    end

    event :process, after: :set_processing_at do
      transitions from: :pending, to: :processing
    end

    event :transfer, after: :set_transferred_at do
      transitions from: :processing, to: :transferred
    end

    event :finish, after: [:set_finished_at, :create_account_statement, :unfreeze] do
      transitions from: :transferred, to: :finished
    end
  end
  
  validate do |withdraw|
    withdraw.must_greater_then_amount
  end

  before_validation :set_code
  after_create :freeze_amount

  def create_account_statement
    user.account_statements.create(amount: amount, type_identifier: :outgoing, meta: :withdrawed, description: "订单号: #{code}")
  end

  def unfreeze
    user_payment = user.user_payment
    user_payment.update(freeze_amount: user_payment.freeze_amount - amount)
  end

  def must_greater_then_amount
    if user.user_payment.amount < amount
      errors.add(:base, '已经超出了您能够提现的金额!')
    end
  end

  def freeze_amount
    user_payment = user.user_payment
    user_payment.update(amount: user_payment.amount - amount, freezing_amount: user_payment.freezing_amount + amount)
  end

  def pay_back
    user_payment = user.user_payment
    user_payment.update(amount: user_payment.amount + amount)
  end

  def set_code
    self.code = "#{Time.zone.now.strftime("%Y%m%d%H%M%S")}#{rand(9999)}" unless code
  end

  def method_missing(method_name, *arg)
    if method_name.match(/_time/)
      arr = method_name.to_s.split('_')
      self.send("#{arr[0]}_at")
    elsif method_name.match(/set_\w+_at/)  # 匹配 set_finished_at 
      arr = method_name.to_s.split('_')
      self.update(:"#{arr[1]}_at" => Time.zone.now)
    else
      super
    end
  end

  def self.by_hash(hash)
    self.send(hash['time']) unless hash['time'] == 'all'
    self.send(hash['state']) unless hash['state'] == 'all'
    self
  end
end
