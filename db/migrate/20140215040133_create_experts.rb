class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name
      t.string :avatar
      t.text   :description

      t.timestamps
    end
  end
end
