class CreateAuctionProductDetails < ActiveRecord::Migration
  def change
    create_table :auction_product_details do |t|
      t.integer :auction_product_id
      t.text :body
 
      t.timestamps
    end
 
    add_index :auction_product_details, :auction_product_id
  end
end