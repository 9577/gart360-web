class RenameEncryptedPaymentPassword < ActiveRecord::Migration
  def change
    rename_column :user_payments, :encrypted_payment_password, :encrypted_password
  end
end
