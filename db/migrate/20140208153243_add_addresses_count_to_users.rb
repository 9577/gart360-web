class AddAddressesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :addresses_count, :integer, default: 0
  end
end
