class CreateAccountStatements < ActiveRecord::Migration
  def change
    create_table :account_statements do |t|
      t.integer :user_id

      t.decimal :amount, precision: 20, scale: 2

      t.string :type_identifier
      t.string :meta
      t.string :description

      t.timestamps
    end

    add_index :account_statements, :user_id
    add_index :account_statements, :type_identifier
    add_index :account_statements, :meta
  end
end
