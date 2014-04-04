class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.integer :auction_product_id
      t.integer :user_id

      t.datetime :freezed_at
      t.datetime :unfreezed_at
      t.datetime :removed_at

      t.string   :state

      t.timestamps
    end

    add_index :deposits, :auction_product_id
    add_index :deposits, :user_id
    add_index :deposits, :state
  end
end
