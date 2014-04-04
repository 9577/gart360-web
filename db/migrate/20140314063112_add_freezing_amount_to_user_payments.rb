class AddFreezingAmountToUserPayments < ActiveRecord::Migration
  def change
    add_column :user_payments, :freezing_amount, :decimal, precision: 20, scale: 2, default: 0
  end
end
