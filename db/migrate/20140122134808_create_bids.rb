class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :auction_product_id
      t.decimal :price, precision: 20, scale: 2

      t.timestamps
    end

    add_index :bids, :user_id
    add_index :bids, :auction_product_id
  end
end
