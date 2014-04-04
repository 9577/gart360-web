class AddBidsCountToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :bids_count, :integer, default: 0
    add_index :auction_products, :bids_count
  end
end
