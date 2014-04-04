# == Schema Information
#
# Table name: deposits
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  freezed_at   :datetime
#  unfreezed_at :datetime
#  removed_at   :datetime
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  product_id   :integer
#

class Deposit < ActiveRecord::Base
  include AASM

  belongs_to :product
  belongs_to :user

  symbolize :state, in: [ :freezed, :unfreezed, :removed ], scopes: :shallow, methods: true, default: :freezed

  aasm column: :state do
    state :freezed, initial: true
    state :unfreezed
    state :removed

    event :unfreeze, after: :after_unfreezed! do
      transitions from: :freezed, to: :unfreezed
    end

    event :remove, after: :after_removed! do
      transitions from: :freezed, to: :removed
    end
  end
  before_create :set_freezed_at

  def set_freezed_at
    self.freezed_at = Time.zone.now
  end

  def after_unfreezed!
    update_attribute(:unfreezed_at, Time.zone.now)
  end

  def after_removed!
    update_attribute(:removed_at, Time.zone.now)    
  end

  def self.total_amount_freezed
    self.freezed.map{|deposit| deposit.product.deposit}.sum
  end

  def method_missing(method_name, *arg)
    method_name = method_name.to_s
    if method_name.match(/_at_text/)
      arr = method_name.split('_')
      begin
        self.send("#{arr[0]}_at").strftime('%F %R')
      rescue
        ''
      end
    else
      super
    end
  end
end
