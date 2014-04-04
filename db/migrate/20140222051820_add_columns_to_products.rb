class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :delay_time, :integer
    add_column :products, :deposit, :decimal, precision: 20, scale: 2, default: 100
  end
end
