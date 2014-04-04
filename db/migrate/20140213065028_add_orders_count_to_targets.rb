class AddOrdersCountToTargets < ActiveRecord::Migration
  def change
    add_column :users, :orders_count, :integer, default: 0
    add_column :auction_products, :orders_count, :integer, default: 0
  end
end
