class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :artist_id
      t.integer :user_id

      t.string  :background
      t.string  :school
      t.string  :major
      t.date    :entrance_date

      t.timestamps
    end

    add_index :educations, :artist_id
    add_index :educations, :user_id
    add_index :educations, :school
  end
end
