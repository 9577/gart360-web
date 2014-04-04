class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer  :user_id
      t.decimal  :amount, precision: 20, scale: 2
      t.integer  :coin

      t.timestamps
    end

    add_index :exchanges, :user_id
  end
end
