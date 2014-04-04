class AddPositionToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :position, :integer, default: 1

    add_index :experts, :position
  end
end
