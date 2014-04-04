class AddGalleriesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :galleries_count, :integer, default: 0
  end
end
