class AddPublishedAtToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :published_at, :datetime
    add_column :auction_products, :finished_at, :datetime
  end
end
