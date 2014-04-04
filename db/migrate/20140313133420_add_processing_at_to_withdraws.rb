class AddProcessingAtToWithdraws < ActiveRecord::Migration
  def change
    add_column :withdraws, :processing_at, :datetime
  end
end
