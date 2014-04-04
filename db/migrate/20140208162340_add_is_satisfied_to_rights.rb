class AddIsSatisfiedToRights < ActiveRecord::Migration
  def change
    add_column :rights, :is_satisfied, :boolean

    add_index :rights, :is_satisfied
  end
end
