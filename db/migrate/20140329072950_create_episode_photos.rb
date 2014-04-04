class CreateEpisodePhotos < ActiveRecord::Migration
  def change
    create_table :episode_photos do |t|
      t.integer :episode_id
      t.string  :data
      t.integer :position

      t.timestamps
    end

    add_index :episode_photos, :episode_id
    add_index :episode_photos, :position
  end
end
