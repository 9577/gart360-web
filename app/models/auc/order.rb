# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  code            :string(255)
#  price           :decimal(20, 2)   default(0.0)
#  delivery_code   :string(255)
#  state           :string(255)
#  delivered_at    :datetime
#  finished_at     :datetime
#  closed_at       :datetime
#  paid_at         :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  product_id      :integer
#  is_auction      :boolean          default(FALSE)
#  delivery_price  :decimal(20, 2)   default(0.0)
#  target_id       :integer
#  target_type     :string(255)
#  type_identifier :string(255)
#  address_id      :integer
#

class Order < ActiveRecord::Base
  include AASM

  STATES = [ :pending, :paid, :delivered, :finished, :closed ]

  # 标识订单交易类型, 从而判断支付后的行为, 默认一般交易(trade)
  TYPE_IDENTIFIERS = [ :recharged, :bid, :trade ]

  belongs_to :user, counter_cache: true

  belongs_to :product, counter_cache: true
  belongs_to :target, polymorphic: true
  belongs_to :address

  has_one :right

  symbolize :state, in: STATES, default: :pending, scopes: :shallow, methods: true
  symbolize :type_identifier, in: TYPE_IDENTIFIERS, default: :trade, scopes: :shallow, methods: true
  scope :auction, ->{ where(is_auction: true) }
  
  aasm column: :state do
    state :pending, initial: true
    state :paid
    state :delivered
    state :finished
    state :closed

    event :pay, after: [:set_times, :do_for_target] do
      transitions from: :pending, to: :paid
    end

    event :deliver, after: :set_times do
      transitions from: :paid, to: :delivered
    end

    event :finish, after: :set_times do
      transitions from: :delivered, to: :finished
    end

    event :close, after: :set_times do
      transitions from: :pending, to: :closed
    end
  end

  before_create :set_code
  
  def do_for_target
    if target_type == 'RechargeRecord'
      target.finish!
    end
  end

  def set_code
    self.code = "#{Time.zone.now.strftime("%Y%m%d%H%M%S")}#{rand(9999)}" unless code
  end

  def set_times
    self.send("#{self.state}_at=", Time.now)
    save!
  end

  before_create :build_is_auction
  def build_is_auction
    self.is_auction = self.product.auction? if product_id
  end

  def method_missing(method_name, *arg)
    arr = method_name.to_s.split('_')
    if Order::STATES.include?(arr.first.to_sym)
      value = self.send("#{arr[0]}_#{arr[1]}")
      value ? value.strftime('%F %R') : nil
    else
      super
    end
  end

end
