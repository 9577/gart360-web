class AddFinishedAtToWithdraws < ActiveRecord::Migration
  def change
    add_column :withdraws, :finished_at, :datetime
  end
end
