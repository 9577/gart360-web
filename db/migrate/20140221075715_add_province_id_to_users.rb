class AddProvinceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :province_id, :integer

    add_index :users, :province_id
  end
end
