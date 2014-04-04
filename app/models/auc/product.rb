# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  title           :string(255)
#  user_id         :integer
#  base_price      :decimal(20, 2)
#  current_price   :decimal(20, 2)
#  per_price       :decimal(20, 2)
#  photos_count    :integer          default(0)
#  bids_count      :integer          default(0)
#  orders_count    :integer          default(0)
#  auction_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  category_id     :integer
#  start_at        :datetime
#  end_at          :datetime
#  deposit         :decimal(20, 2)   default(100.0)
#  type_identifier :string(255)
#  is_investable   :boolean          default(FALSE)
#  per_coin        :integer          default(0)
#  state           :string(255)
#  story           :text
#  delay_time      :integer          default(5)
#

class Product < ActiveRecord::Base

  attr_readonly :photos_count,
                :bids_count,
                :orders_count

  validates :title, :base_price, :per_price, presence: true
  validates :start_at, :end_at, presence: true, unless: :is_auction?

  belongs_to :user
  belongs_to :auction, counter_cache: :products_count

  belongs_to :category
  
  has_one :detail, class_name: 'ProductDetail'
  has_one :product_owner

  has_many :photos, class_name: 'ProductPhoto'
  has_many :reviews
  has_many :product_attributes
  has_many :bids
  has_many :orders

  accepts_nested_attributes_for :detail
  accepts_nested_attributes_for :product_owner
  accepts_nested_attributes_for :photos
  accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :product_attributes

  symbolize :type_identifier, in: [ :auction, :zero, :charity ], scopes: :shallow, methods: true, default: :auction
  symbolize :state, in: [ :treated, :untreated ], scopes: :shallow, methods: true, default: :untreated

  scope :pending, ->{ where('start_at > ?', Time.zone.now) }
  scope :active, ->{ where('start_at < ? AND end_at > ?', Time.zone.now, Time.zone.now) }
  scope :closed, ->{ where('end_at < ?', Time.zone.now) }
  scope :investable, ->{ where(is_investable: true) }

  scope :filter_by_type, ->(type){ send(type) }
  scope :filter_by_category, ->(cat_id){ where(category_id: cat_id) if cat_id != 'all' }
  scope :filter_by_state, ->(state){ send(state) }

  before_create :build_price_and_time

  def square_cover_url(width=230, height=230)
    photos.first.image_url(width, height)
  end

  def is_auction?
    self.auction?
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

  def state_text
    if pending?
      :pending
    elsif active?
      :active
    elsif closed?
      :closed
    end
  end


  def default_bid
    self.bids.count == 0 ? current_price : (current_price + per_price)
  end

  def build_price_and_time
    self.current_price = self.base_price

    if self.auction?
      self.start_at = self.auction.start_at
      self.end_at = self.auction.end_at
    end
  end

  def owner_class
    user_id ? user.class.name : product_owner.class.name
  end

  def owner_name
    user_id ? user.username : product_owner.name
  end

  def top_price_bid
    bids.order('price DESC').limit(1).first
  end

  def self.generate_orders
    self.untreated.auction.each do |product|
      next unless bid = product.top_price_bid
      product.orders.find_or_create_by(user_id: bid.user_id, price: bid.price, is_auction: true, type_identifier: :bid)
      product.update(state: :treated)
    end
  end
end
