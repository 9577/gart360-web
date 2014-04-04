class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :banner
      t.datetime :start_at
      t.datetime :end_at

      t.integer :products_count, default: 0

      t.timestamps
    end

    add_index :auctions, :start_at
    add_index :auctions, :end_at
  end
end
