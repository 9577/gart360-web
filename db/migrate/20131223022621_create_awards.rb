class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :works_name
      t.string :content
      t.date :at_time
      t.string :address
      t.references :user, index: true

      t.timestamps
    end
  end
end
