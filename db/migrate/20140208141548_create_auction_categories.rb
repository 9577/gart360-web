class CreateAuctionCategories < ActiveRecord::Migration
  def change
    create_table :auction_categories do |t|
      t.string  :name
      t.integer :position, default: 1
      t.integer :products_count, default: 1
 
      t.timestamps
    end
 
    add_index :auction_categories, :position
  end
end