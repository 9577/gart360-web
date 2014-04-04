class AddPositionToDailyItemPhotos < ActiveRecord::Migration
  def change
    add_column :daily_item_photos, :position, :integer, default: 1

    add_index :daily_item_photos, :position
  end
end
