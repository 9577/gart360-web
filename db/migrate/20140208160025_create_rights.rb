class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.integer :order_id

      t.boolean :is_received, default: false
      t.string  :type_identifier
      t.text    :body
      t.integer :certificates_count, default: 0

      t.timestamps
    end

    add_index :rights, :order_id
    add_index :rights, :type_identifier
    add_index :rights, :is_received
  end
end
