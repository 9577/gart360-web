class RemoveBooleanColumnsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :is_zero_auction
    remove_column :products, :is_charity
  end
end
