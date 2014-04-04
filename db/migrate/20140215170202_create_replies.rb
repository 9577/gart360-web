class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :topic_id
      t.text    :body
      t.integer :quote_id

      t.timestamps
    end

    add_index :replies, :topic_id
    add_index :replies, :quote_id
  end
end
