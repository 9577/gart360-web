class AddAuctionIdToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :auction_id, :integer
    add_index :auction_products, :auction_id
  end
end
