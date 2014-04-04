class AddStateToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :state, :string

    add_index :auction_products, :state
  end
end
