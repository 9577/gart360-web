class RemoveBodyFromAuctionProducts < ActiveRecord::Migration
  def change
    remove_column :auction_products, :body
  end
end
