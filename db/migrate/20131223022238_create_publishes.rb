class CreatePublishes < ActiveRecord::Migration
  def change
    create_table :publishes do |t|
      t.string :pub_name
      t.date :pub_time
      t.string :article
      t.references :user, index: true

      t.timestamps
    end
  end
end
