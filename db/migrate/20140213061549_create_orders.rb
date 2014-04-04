class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :target_id
      t.string  :target_type
      t.string  :code
      t.decimal :price, precision: 20, scale: 2, default: 0

      t.string :delivery_code
      t.string :state

      t.datetime :delivered_at
      t.datetime :finished_at
      t.datetime :closed_at
      t.datetime :paid_at

      t.timestamps
    end

    add_index :orders, :user_id
    add_index :orders, [ :target_id, :target_type ]
    add_index :orders, :code
  end
end
