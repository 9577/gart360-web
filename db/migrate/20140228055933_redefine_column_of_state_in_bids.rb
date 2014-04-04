class RedefineColumnOfStateInBids < ActiveRecord::Migration
  def change
    remove_column :bids, :state
    add_column :bids, :state, :string

    add_index :bids, :state
  end
end
