class AddResponseToRightDescriptions < ActiveRecord::Migration
  def change
    add_column :right_descriptions, :response, :text
  end
end
