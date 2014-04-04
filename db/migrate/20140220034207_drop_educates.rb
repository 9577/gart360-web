class DropEducates < ActiveRecord::Migration
  def change
    drop_table :educates
  end
end
