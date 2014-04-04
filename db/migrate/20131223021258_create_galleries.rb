class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.text :content
      t.integer :status
      t.integer :artworks_count,:default=>0
      t.references :user, index: true

      t.timestamps
    end
    Gallery.reset_column_information
      Gallery.find(:all).each do |p|
        Gallery.update_counters p.id, :artworks_count => p.artworks.length
      end
  end
end
