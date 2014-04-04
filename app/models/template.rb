# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Template < ActiveRecord::Base
	has_many :captchas
end
