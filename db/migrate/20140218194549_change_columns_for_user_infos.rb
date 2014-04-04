class ChangeColumnsForUserInfos < ActiveRecord::Migration
  def change

    remove_column :user_infos, :area_id

    add_column :user_infos, :city_id, :integer
    add_index :user_infos, :city_id

    rename_column :user_infos, :birthday, :birthdate

    remove_column :user_infos, :sex

    add_column :user_infos, :gender, :string

  end
end
