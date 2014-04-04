class AddUrlToAds < ActiveRecord::Migration
  def change
    add_column :ads, :url, :string
  end
end
