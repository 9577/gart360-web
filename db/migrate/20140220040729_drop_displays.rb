class DropDisplays < ActiveRecord::Migration
  def change
    drop_table :displays
  end
end
