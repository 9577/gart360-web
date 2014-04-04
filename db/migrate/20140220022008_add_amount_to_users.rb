class AddAmountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount, :decimal, precision: 20, scale: 2
  end
end
