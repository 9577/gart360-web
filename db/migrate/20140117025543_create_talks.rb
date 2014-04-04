class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :content
      t.references :user, index: true 
      t.timestamps
    end
  end
end
