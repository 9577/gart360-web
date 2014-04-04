class AddStartAtAndEndAtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :start_at, :datetime
    add_column :products, :end_at, :datetime

    add_index :products, :start_at
    add_index :products, :end_at
  end
end
