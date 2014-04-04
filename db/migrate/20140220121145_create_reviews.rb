class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.integer :expert_id
      t.text    :body

      t.integer :position, default: 1

      t.timestamps
    end

    add_index :reviews, :product_id
    add_index :reviews, :expert_id
    add_index :reviews, :position
  end
end
