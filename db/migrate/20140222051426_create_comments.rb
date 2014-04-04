class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body

      t.integer :target_id
      t.string  :target_type
      t.integer :user_id

      t.timestamps
    end

    add_index :comments, [ :target_id, :target_type ]
    add_index :comments, :user_id
  end
end
