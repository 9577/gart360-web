class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :product_id
      t.integer :user_id

      t.integer :quantity, default: 1

      t.timestamps
    end

    add_index :investments, :product_id
    add_index :investments, :user_id
    add_index :investments, :quantity
  end
end
