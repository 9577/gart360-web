class ChangeAwardsColumns < ActiveRecord::Migration
  def change
    rename_column :awards, :works_name, :artwork
    remove_column :awards, :at_time

    remove_column :awards, :address

    add_column :awards, :city_id, :integer
    add_column :awards, :year, :integer
  end
end