class AddIsAuctionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_auction, :boolean, default: false

    add_index :orders, :is_auction
  end
end
