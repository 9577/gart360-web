class AddPhotosCountToDailyItems < ActiveRecord::Migration
  def change
    add_column :daily_items, :photos_count, :integer, default: 0
  end
end
