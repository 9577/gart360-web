class DropAuctionCategories < ActiveRecord::Migration
  def change

    drop_table :auction_categories

  end
end
