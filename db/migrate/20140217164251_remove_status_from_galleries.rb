class RemoveStatusFromGalleries < ActiveRecord::Migration
  def change
    remove_column :galleries, :status
  end
end
