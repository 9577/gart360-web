class CreateAuctionProductPhotos < ActiveRecord::Migration
  def change
    create_table :auction_product_photos do |t|
 
      t.integer :auction_product_id
      t.string  :image
      t.integer :position, default: 1
 
      t.timestamps
    end
 
    add_index :auction_product_photos, :auction_product_id
    add_index :auction_product_photos, :position
  end
end