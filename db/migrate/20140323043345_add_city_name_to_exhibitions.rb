class AddCityNameToExhibitions < ActiveRecord::Migration
  def change
    add_column :exhibitions, :city_name, :string
  end
end
