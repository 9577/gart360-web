class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :content
      t.string :avatar
      t.integer :images_count,:default=>0
      t.integer :status
      t.references :user, index: true
      t.references :gallery, index: true

      t.timestamps

      
    end
    Artwork.reset_column_information
      Artwork.find(:all).each do |p|
        Artwork.update_counters p.id, :tasks_count => p.images.length
      end
  end
end
