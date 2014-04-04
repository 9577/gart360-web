class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.string :works_name
      t.string :name
      t.date :at_time
      t.string :address
      t.references :user, index: true

      t.timestamps
    end
  end
end
