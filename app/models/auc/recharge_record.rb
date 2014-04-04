# == Schema Information
#
# Table name: recharge_records
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  amount      :decimal(20, 2)
#  state       :string(255)
#  finished_at :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  code        :string(255)
#  discount    :decimal(20, 2)   default(0.0)
#

class RechargeRecord < ActiveRecord::Base
  include AASM
  belongs_to :user
  has_one :order, as: :target

  STATES = [:pending, :processing, :finished]

  symbolize :state, in: STATES, default: :pending, scopes: :shallow

  validates :user_id, :amount, :code, :discount, presence: true
  validates :code, uniqueness: true
  validates_numericality_of :amount, greater_than: 0

  aasm column: :state do
    state :pending, initial: true
    state :processing
    state :finished

    event :process do
      transitions from: :pending, to: :processing
    end

    event :finish, after: Proc.new { set_time_and_give_money } do
      transitions from: :processing, to: :finished
    end
  end

  before_validation :set_code
  
  def set_time_and_give_money
    self.finished_at = Time.zone.now
    user.user_payment.update(amount: user.user_payment.amount + amount)
    user.account_statements.create(amount: amount, type_identifier: :income, meta: :recharged)
    self.save!
  end

  def set_code
    self.code = "#{Time.zone.now.strftime("%Y%m%d%H%M%S")}#{rand(9999)}" unless code
  end

end
