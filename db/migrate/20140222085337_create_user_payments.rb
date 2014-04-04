class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|
      t.integer :user_id
      t.string  :encrypted_payment_password
      t.decimal :amount, precision: 20, scale: 2, default: 0
      t.integer :coin, default: 0

      t.timestamps
    end

    add_index :user_payments, :user_id
  end
end
