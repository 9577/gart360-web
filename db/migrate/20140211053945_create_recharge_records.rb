class CreateRechargeRecords < ActiveRecord::Migration
  def change
    create_table :recharge_records do |t|
      t.belongs_to :user
      t.decimal :amount, precision: 20, scale: 2
      t.string :state
      t.datetime :finished_at
      t.timestamps
    end

    add_index :recharge_records, :user_id
  end
end
