class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :district_id
      t.string  :body
      t.string  :recipient
      t.boolean :is_default, default: false

      t.timestamps
    end

    add_index :addresses, :user_id
  end
end
