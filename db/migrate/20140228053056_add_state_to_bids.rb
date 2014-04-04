class AddStateToBids < ActiveRecord::Migration
  def change
    add_column :bids, :state, :string, default: :active
  end
end
