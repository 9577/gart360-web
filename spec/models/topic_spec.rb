# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  body           :text
#  user_id        :integer
#  replies_count  :integer          default(0)
#  is_recommended :boolean          default(FALSE)
#  created_at     :datetime
#  updated_at     :datetime
#  group_id       :integer
#

require 'spec_helper'

describe Topic do
  pending "add some examples to (or delete) #{__FILE__}"
end
