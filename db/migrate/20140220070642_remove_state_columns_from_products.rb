class RemoveStateColumnsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :state
    remove_column :products, :published_at
    remove_column :products, :finished_at
  end
end
