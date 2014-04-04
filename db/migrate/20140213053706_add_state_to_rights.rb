class AddStateToRights < ActiveRecord::Migration
  def change
    add_column :rights, :state, :string
  end
end
