class CreateCaptchas < ActiveRecord::Migration
  def change
    create_table :captchas do |t|
      t.string :mobile
      t.string :code
      t.integer :status
      t.references :template, index: true

      t.timestamps
    end
  end
end
