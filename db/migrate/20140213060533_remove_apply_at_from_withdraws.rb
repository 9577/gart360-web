class RemoveApplyAtFromWithdraws < ActiveRecord::Migration
  def change
    remove_column :withdraws, :apply_at
  end
end
