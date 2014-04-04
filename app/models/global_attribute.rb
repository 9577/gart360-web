# == Schema Information
#
# Table name: global_attributes
#
#  id                          :integer          not null, primary key
#  global_attribute_catalog_id :integer
#  value                       :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

class GlobalAttribute < ActiveRecord::Base

	belongs_to :global_attribute_catalog

end
