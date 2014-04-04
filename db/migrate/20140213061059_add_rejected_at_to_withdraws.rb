class AddRejectedAtToWithdraws < ActiveRecord::Migration
  def change
    add_column :withdraws, :rejected_at, :datetime
  end
end
