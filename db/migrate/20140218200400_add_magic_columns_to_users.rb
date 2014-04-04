class AddMagicColumnsToUsers < ActiveRecord::Migration
  def change

    add_column :users, :birthdate, :date
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
    add_column :users, :city_id, :integer
    add_column :users, :gender, :string

  end
end