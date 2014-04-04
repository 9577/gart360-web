# == Schema Information
#
# Table name: rights
#
#  id                 :integer          not null, primary key
#  order_id           :integer
#  is_received        :boolean          default(FALSE)
#  type_identifier    :string(255)
#  certificates_count :integer          default(0)
#  created_at         :datetime
#  updated_at         :datetime
#  is_satisfied       :boolean
#  state              :string(255)
#

class Right < ActiveRecord::Base
  include AASM
  attr_readonly :certificates_count

  STATE = [:pending, :confirmed, :closed]

  belongs_to :order
  has_many :descriptions, class_name: 'RightDescription'

  accepts_nested_attributes_for :descriptions

  symbolize :type_identifier, in: [ :fee, :product ], scopes: :shallow, methods: true, default: :fee

  symbolize :state, in: STATE, default: :pending, scopes: :shallow, methods: true

  scope :satisfied, ->{ where(is_satisfied: true) }

  aasm column: :state do
    state :pending, initial: true
    state :confirmed
    state :closed

    event :confirm do
      transitions from: :pending, to: :confirmed
    end

    event :close do
      transitions from: :confirmed, to: :closed
    end
  end

  def is_satisfied_text
    self.is_satisfied ? '满意' : '不满意'
  end

  def is_received_text
    self.is_received ? '到货' : '未到货'
  end
end
