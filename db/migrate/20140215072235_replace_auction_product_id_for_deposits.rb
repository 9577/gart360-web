class ReplaceAuctionProductIdForDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :product_id, :integer
    remove_column :deposits, :auction_product_id

    add_index :deposits, :product_id
  end
end
