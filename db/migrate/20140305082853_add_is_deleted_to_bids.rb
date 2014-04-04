class AddIsDeletedToBids < ActiveRecord::Migration
  def change
    add_column :bids, :is_deleted, :boolean, default: false

    add_index :bids, :is_deleted
  end
end
