class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :target_id
      t.string  :target_type

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, [ :target_id, :target_type ]
  end
end
