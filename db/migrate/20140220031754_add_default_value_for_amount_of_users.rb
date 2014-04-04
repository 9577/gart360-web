class AddDefaultValueForAmountOfUsers < ActiveRecord::Migration
  def change
    remove_column :users, :amount
    add_column :users, :amount, :decimal, precision: 20, scale: 2, default: 0
  end
end
