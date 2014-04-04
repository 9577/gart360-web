class ReplaceAuctionProductIdForBids < ActiveRecord::Migration
  def change
    add_column :bids, :product_id, :integer
    remove_column :bids, :auction_product_id

    add_index :bids, :product_id
  end
end
