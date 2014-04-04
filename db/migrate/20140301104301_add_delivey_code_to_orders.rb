class AddDeliveyCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_price, :decimal, precision: 20, scale: 2
  end
end
