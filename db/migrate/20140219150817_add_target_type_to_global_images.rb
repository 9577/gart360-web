class AddTargetTypeToGlobalImages < ActiveRecord::Migration
  def change
    add_column :global_images, :target_type, :string
  end
end
