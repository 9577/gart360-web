# == Schema Information
#
# Table name: wikis
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  body             :text
#  wiki_category_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Wiki < ActiveRecord::Base
  belongs_to :wiki_category, counter_cache: true
end
