class AddStoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :story, :text
  end
end
