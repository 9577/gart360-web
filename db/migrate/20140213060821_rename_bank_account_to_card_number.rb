class RenameBankAccountToCardNumber < ActiveRecord::Migration
  def change
    rename_column :withdraws, :bank_account, :card_number
  end
end
