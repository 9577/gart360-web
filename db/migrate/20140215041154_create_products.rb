class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :type

      t.string  :title

      t.integer :user_id
      t.decimal :base_price, precision: 20, scale: 2
      t.decimal :current_price, precision: 20, scale: 2
      t.decimal :per_price, precision: 20, scale: 2

      t.integer :photos_count, default: 0
      t.integer :bids_count, default: 0
      t.integer :orders_count, default: 0

      t.integer :auction_id

      t.boolean :is_zero_auction, default: false
      t.boolean :is_charity, default: false

      t.string  :state

      t.datetime :published_at
      t.datetime :finished_at

      t.timestamps
    end

    add_index :products, :user_id
    add_index :products, :auction_id
    add_index :products, :state
    add_index :products, :type
  end
end