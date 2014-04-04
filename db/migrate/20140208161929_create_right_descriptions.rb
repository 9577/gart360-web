class CreateRightDescriptions < ActiveRecord::Migration
  def change
    create_table :right_descriptions do |t|
      t.integer :right_id

      t.text    :body

      t.timestamps
    end

    add_index :right_descriptions, :right_id
  end
end
