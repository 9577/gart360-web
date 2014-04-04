class CreateGlobalImages < ActiveRecord::Migration
  def change
    create_table :global_images do |t|
      t.integer :user_id
      t.string :data

      t.timestamps
    end

    add_index :global_images, :user_id
  end
end
