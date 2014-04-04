# == Schema Information
#
# Table name: global_attribute_catalogs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class GlobalAttributeCatalog < ActiveRecord::Base
	belongs_to  :category
	has_many :global_attributes,dependent: :destroy
	accepts_nested_attributes_for :global_attributes,:allow_destroy => true
end
