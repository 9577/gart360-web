class CreateDailyItemPhotos < ActiveRecord::Migration
  def change
    create_table :daily_item_photos do |t|
      t.integer :daily_item_id
      t.string  :data

      t.timestamps
    end

    add_index :daily_item_photos, :daily_item_id
  end
end
