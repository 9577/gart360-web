class AddPhotosCountToAuctionProducts < ActiveRecord::Migration
  def change
    add_column :auction_products, :photos_count, :integer, default: 0
  end
end
