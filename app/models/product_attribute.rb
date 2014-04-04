# == Schema Information
#
# Table name: product_attributes
#
#  id         :integer          not null, primary key
#  product_id :integer
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ProductAttribute < ActiveRecord::Base
  # 尺寸   # 主题    # 形式
  ATTRIBUTES = [ :size, :subject, :shape ]

  validates :value, presence: true

  belongs_to :product

  symbolize :name, in: ATTRIBUTES
end
