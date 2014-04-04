class RemovePaymentColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_payment_password
    remove_column :users, :amount
  end
end
