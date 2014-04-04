class CreateDailyItems < ActiveRecord::Migration
  def change
    create_table :daily_items do |t|
      t.string  :title
      t.text    :description
      t.decimal :price, precision: 20, scale: 2, default: 0

      t.date    :start_at

      t.timestamps
    end

    add_index :daily_items, :start_at
  end
end
