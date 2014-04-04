class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string  :area
      t.integer :position, default: 1
      t.string  :type_identifier
      t.string  :title
      t.text    :body
      t.string  :image

      t.timestamps
    end

    add_index :ads, :area
    add_index :ads, :type_identifier
    add_index :ads, :position
  end
end
