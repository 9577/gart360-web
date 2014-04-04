# == Schema Information
#
# Table name: wiki_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  wikis_count :integer          default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

class WikiCategory < ActiveRecord::Base
  has_many :wikis
end
