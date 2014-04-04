class CreateGalleryTags < ActiveRecord::Migration
  def change
    create_table :gallery_tags do |t|
      t.references :gallery, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
