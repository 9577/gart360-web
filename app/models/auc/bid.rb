# == Schema Information
#
# Table name: bids
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  price        :decimal(20, 2)
#  created_at   :datetime
#  updated_at   :datetime
#  is_anonymous :boolean
#  product_id   :integer
#  state        :string(255)
#  is_deleted   :boolean          default(FALSE)
#

class Bid < ActiveRecord::Base

  validates :price, presence: true

  belongs_to :user
  belongs_to :product, counter_cache: true

  # active表示 正在冻结中的(此时说明该bid处于最高价状态)
  # inactive表示 过期的bid, 此时的bid处于淘汰
  # 每次新bid产生后, 执行 update_state_all 更新所有bid状态

  symbolize :state, in: [:active, :inactive], default: :active, scopes: :shallow, methods: true

  scope :real, -> { where.not('id IS NULL') }
  scope :by_product, ->(product_id) { where(product_id: product_id) }
  
  scope :exist, ->{ where(is_deleted: false) }
  scope :deleted, ->{ where(is_deleted: true) }

  scope :active_products, ->{ joins(:product).where("products.end_at > ?", Time.zone.now).order('price desc') }
  scope :closed_products, ->{ joins(:product).where("products.end_at <= ?", Time.zone.now).order('price desc') }

  after_save :update_current_price_for_product, :update_state_all
  after_create :create_account_statement, :delay_end_at, :update_user_payment

  validates_uniqueness_of :price, scope: [:product_id]

  validate do |bid|
    bid.must_can_bid
  end

  def must_can_bid
    if user.user_payment.amount < product.deposit
      errors.add(:base, '余额不足')
    end
  end

  def update_user_payment
    if user.first_bid?
      user.user_payment.update(amount: user.user_payment.amount - product.deposit)
    end
  end

  def create_account_statement
    unless user.has_bid?(product.id)
      user.account_statements.create(amount: price, type_identifier: :outgoing, meta: :deposit_freezed)
      user.deposits.create(product_id: product_id)  # 记录保证金冻结
      # 记录总的金额
      user_payment = user.user_payment
      user_payment.update(amount: user_payment.amount - price, freezing_amount: user_payment.freezing_amount + price)
    end
  end

  def delay_end_at
    product.update(end_at: product.end_at + product.delay_time.minutes)
  end

  def update_state_all
    Bid.where("product_id = '#{product_id}' AND price < #{top_price}").update_all("state = 'inactive'")
  end

  def update_current_price_for_product
    product.update(current_price: top_price)
  end

  def top_price
    product.bids.maximum(:price)
  end

  def name
    is_anonymous ? '匿名用户' : self.user.username
  end

  def state_for_label
    active? ? 'orange' : 'gray6'
  end

  def has_paid?
    begin
      (Order::STATES - [:pending]).include?(product.orders.first.state)
    rescue Exception => e
      false
    end
  end

end
