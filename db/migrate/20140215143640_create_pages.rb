class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :code
      t.text   :body
      t.string :type_identifier

      t.timestamps
    end

    add_index :pages, :code
    add_index :pages, :type_identifier
  end
end
