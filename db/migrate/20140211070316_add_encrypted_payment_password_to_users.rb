class AddEncryptedPaymentPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_payment_password, :string
  end
end
