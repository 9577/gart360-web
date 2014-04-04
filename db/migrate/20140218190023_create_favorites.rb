class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :target_id
      t.string  :target_type

      t.timestamps
    end

    add_index :favorites, :user_id
    add_index :favorites, [ :target_id, :target_type ]
  end
end
