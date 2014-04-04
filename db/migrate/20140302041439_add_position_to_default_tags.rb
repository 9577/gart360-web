class AddPositionToDefaultTags < ActiveRecord::Migration
  def change
    add_column :default_tags, :position, :integer
  end
end
