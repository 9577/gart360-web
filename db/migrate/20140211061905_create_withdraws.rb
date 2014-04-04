class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.belongs_to :user
      t.string :code
      t.datetime :apply_at
      t.datetime :transferred_at
      t.decimal :amount, precision: 20, scale: 2
      t.string :state
      t.string :bank_account
      t.string :bank_name
      t.string :name
      t.string :mobile
      t.text :description
      t.timestamps
    end

    add_index :withdraws, :user_id
  end
end
