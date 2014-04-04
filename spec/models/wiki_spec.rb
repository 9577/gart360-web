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

require 'spec_helper'

describe Wiki do
  pending "add some examples to (or delete) #{__FILE__}"
end
