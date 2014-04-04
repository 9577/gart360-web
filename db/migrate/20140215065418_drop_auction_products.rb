class DropAuctionProducts < ActiveRecord::Migration
  def change
    drop_table :auction_products
    drop_table :auction_product_details
    drop_table :auction_product_photos
  end
end
