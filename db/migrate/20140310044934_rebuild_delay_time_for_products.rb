class RebuildDelayTimeForProducts < ActiveRecord::Migration
  def change
    remove_column :products, :delay_time
    add_column :products, :delay_time, :integer, default: 5
  end
end
