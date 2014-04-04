# == Schema Information
#
# Table name: auctions
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  banner         :string(255)
#  start_at       :datetime
#  end_at         :datetime
#  products_count :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  state          :string(255)
#  is_picked      :boolean          default(FALSE)
#

class Auction < ActiveRecord::Base
  include AASM

  attr_readonly :products_count

  validates :title, :start_at, :end_at, :banner, presence: true

  symbolize :state, in: [ :pending, :active, :closed ], scopes: :shallow, methods: true, default: :pending

  has_many :products

  scope :filter_by_state, ->(state) { send(state.to_sym) }

  aasm column: :state do
    state :pending, initial: true
    state :active
    state :closed

    event :start do
      transitions from: :pending, to: :active
    end

    event :close do
      transitions from: :active, to: :closed
    end

    event :restart do
      transitions from: :closed, to: :active
    end
  end

  def banner_url(width=990, height=280)
    banner << "?imageView2/1/w/#{width}/h/#{height}/format/jpg"
  end

  def logo_url
    products.first.try(:square_cover_url)
  end

  def pending_cover_url
    banner << '?imageView2/1/w/310/h/88/format/jpg'
  end

  def pending?
    start_at > Time.zone.now
  end

  def active?
    start_at < Time.zone.now && end_at > Time.zone.now
  end

  def closed?
    end_at < Time.zone.now
  end

  def switch_pick!
    self.is_picked ? self.update(is_picked: false) : self.update(is_picked: true)
  end

  def start_at_text
    start_at.strftime('%m.%d/%R')
  end

  def end_at_text
    end_at.strftime('%F %H: %M')
  end

  def end_at_for_js
    end_at.strftime('%-m/%-d/%Y %H:%M:%S')
  end

end
