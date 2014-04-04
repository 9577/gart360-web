class AddCityNameToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :city_name, :string
  end
end
