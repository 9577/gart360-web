class DropPublish < ActiveRecord::Migration
  def change
    drop_table :publishes
  end
end
