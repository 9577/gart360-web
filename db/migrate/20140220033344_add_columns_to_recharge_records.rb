class AddColumnsToRechargeRecords < ActiveRecord::Migration
  def change
    add_column :recharge_records, :code, :string
    add_column :recharge_records, :discount, :decimal, precision: 20, scale: 2, default: 0
  end
end
