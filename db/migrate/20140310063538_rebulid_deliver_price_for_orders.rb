class RebulidDeliverPriceForOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery_price
    add_column :orders, :delivery_price, :decimal, precision: 20, scale: 2, default: 0
  end
end
