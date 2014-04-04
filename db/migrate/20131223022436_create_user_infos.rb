class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :sex
      t.date :birthday
      t.text :content
      t.references :area,index: true
      t.string :avatar
      t.references :user, index: true

      t.timestamps
    end
  end
end
