class AddAreaToPages < ActiveRecord::Migration
  def change
    add_column :pages, :area, :string

    add_index :pages, :area
  end
end
