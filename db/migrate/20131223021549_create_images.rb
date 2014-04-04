class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :img
      t.references :artwork, index: true

      t.timestamps
    end
  end
end
