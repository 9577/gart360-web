class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :avatar
      t.string :name
      t.text :content
      t.integer :gallery_num
      t.integer :artwork_num
      t.references :user, index: true

      t.timestamps
    end
  end
end
