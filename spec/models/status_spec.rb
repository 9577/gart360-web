# == Schema Information
#
# Table name: statuses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  body         :text
#  created_at   :datetime
#  updated_at   :datetime
#  images_count :integer          default(0)
#

require 'spec_helper'

describe Status do
  pending "add some examples to (or delete) #{__FILE__}"
end
