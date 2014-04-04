class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name
      t.text    :description
      t.string  :logo
      t.boolean :is_confirm_required, default: false

      t.integer :topics_count, default: 0
      t.integer :members_count, default: 0

      t.timestamps
    end

    add_index :groups, :members_count
    add_index :groups, :topics_count
  end
end
