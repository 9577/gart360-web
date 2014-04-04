class CreateAuctionProducts < ActiveRecord::Migration
  def change
    create_table :auction_products do |t|
      t.string  :title
      t.text    :body
 
      t.integer :user_id
 
      t.decimal :base_price, precision: 20, scale: 2
      t.decimal :current_price, precision: 20, scale: 2
 
      t.timestamps
    end
 
    add_index :auction_products, :user_id
  end
end