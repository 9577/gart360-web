class AddIsPickedToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :is_picked, :boolean, default: false
    add_index :auctions, :is_picked
  end
end
