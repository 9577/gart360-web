class AddMagicColumnsToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :is_zero_auction, :boolean, default: false
    add_column :auction_products, :is_charity, :boolean, default: false

    add_index :auction_products, :is_zero_auction
    add_index :auction_products, :is_charity
  end
end
