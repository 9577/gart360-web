class CreateEducates < ActiveRecord::Migration
  def change
    create_table :educates do |t|
      t.string :edu_record
      t.string :sch_name
      t.string :vocation
      t.date :at_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
