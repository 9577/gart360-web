class RenameContentToBodyForMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :content, :body
  end
end
