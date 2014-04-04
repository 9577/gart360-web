class AddIsRecommendedToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :is_recommended, :boolean, default: false
    add_index :groups, :is_recommended
  end
end
