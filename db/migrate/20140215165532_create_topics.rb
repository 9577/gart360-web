class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :title
      t.text    :body
      t.integer :user_id

      t.integer :replies_count, default: 0
      t.boolean :is_recommended, default: false

      t.timestamps
    end

    add_index :topics, :user_id
    add_index :topics, :replies_count
    add_index :topics, :is_recommended
  end
end
