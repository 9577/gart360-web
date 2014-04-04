# == Schema Information
#
# Table name: product_owners
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  avatar     :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class ProductOwner < ActiveRecord::Base

  validates :name, :avatar, :body, presence: true

  belongs_to :product

end
