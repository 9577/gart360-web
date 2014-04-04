class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :subject
      t.text   :description

      t.integer :user_id

      t.datetime :start_at
      t.datetime :end_at

      t.string :state

      t.integer :images_count, default: 0

      t.timestamps
    end

    add_index :events, :user_id
    add_index :events, :start_at
    add_index :events, :end_at
  end
end
