class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.integer :event_id
      t.integer :image_id
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :event_images, :event_id
    add_index :event_images, :image_id
  end
end
