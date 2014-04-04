class AddIsAnonymousToBids < ActiveRecord::Migration
  def change
    add_column :bids, :is_anonymous, :boolean
  end
end
