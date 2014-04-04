# == Schema Information
#
# Table name: collection_items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  user_id      :integer
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  photos_count :integer          default(0)
#  is_featured  :boolean          default(FALSE)
#  state        :string(255)
#

class CollectionItem < ActiveRecord::Base
  include AASM
  attr_readonly :photos_count

  validates :name, presence: true

  belongs_to :user, counter_cache: true
  has_many :photos, class_name: 'CollectionItemPhoto'
  accepts_nested_attributes_for :photos

  symbolize :state, in: [ :active, :rejected, :pending ], scopes: :shallow, methods: true, default: :active

  aasm column: :state do
    state :active, initial: true
    state :rejected
    state :pending

    event :reject do
      transitions from: :active, to: :rejected
    end

    event :pend do
      transitions from: :rejected, to: :pending
    end

    event :approve do
      transitions from: :pending, to: :active
    end
  end

  def is_featured_text
    is_featured ? '是' : '否'
  end
end
