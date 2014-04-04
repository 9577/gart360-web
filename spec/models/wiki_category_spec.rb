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

require 'spec_helper'

describe WikiCategory do
  pending "add some examples to (or delete) #{__FILE__}"
end
