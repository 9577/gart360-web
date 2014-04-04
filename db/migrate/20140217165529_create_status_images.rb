class CreateStatusImages < ActiveRecord::Migration
  def change
    create_table :status_images do |t|
      t.integer :status_id
      t.string  :data
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :status_images, :status_id
    add_index :status_images, :position
    
    add_column :statuses, :images_count, :integer, default: 0
  end
end
