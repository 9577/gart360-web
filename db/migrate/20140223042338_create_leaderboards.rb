class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.integer :target_id
      t.string  :target_type

      t.string :type_identifier
      t.integer :position

      t.timestamps
    end

    add_index :leaderboards, [ :target_id, :target_type ]
    add_index :leaderboards, :type_identifier
    add_index :leaderboards, :position
  end
end
