# == Schema Information
#
# Table name: product_details
#
#  id         :integer          not null, primary key
#  product_id :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class ProductDetail < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :product

end
