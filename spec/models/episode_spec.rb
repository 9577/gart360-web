# == Schema Information
#
# Table name: episodes
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  body                :text
#  is_featured         :boolean          default(FALSE)
#  photos_count        :integer          default(0)
#  created_at          :datetime
#  updated_at          :datetime
#  episode_category_id :integer
#

require 'spec_helper'

describe Episode do
  pending "add some examples to (or delete) #{__FILE__}"
end
