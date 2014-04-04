class AddPerPriceToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :per_price, :decimal, precision: 20, scale: 2
  end
end
