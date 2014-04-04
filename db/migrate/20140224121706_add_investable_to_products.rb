class AddInvestableToProducts < ActiveRecord::Migration
  def change

    add_column :products, :is_investable, :boolean, default: false
    add_column :products, :per_coin, :integer, default: 0

    add_index :products, :is_investable

  end
end
