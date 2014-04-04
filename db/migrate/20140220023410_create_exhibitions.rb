class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.integer :artist_id
      t.integer :user_id

      t.string :name
      t.string :artwork_name

      t.integer :year
      t.integer :city_id

      t.timestamps
    end

    add_index :exhibitions, :artist_id
    add_index :exhibitions, :user_id
  end
end
