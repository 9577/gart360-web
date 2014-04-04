class CreateRightCertificates < ActiveRecord::Migration
  def change
    create_table :right_certificates do |t|
      t.integer :right_id
      t.string  :image
      t.integer :position, default: 1

      t.timestamps
    end

    add_index :right_certificates, :right_id
    add_index :right_certificates, :position
  end
end
