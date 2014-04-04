# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  body       :text
#  quote_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require 'spec_helper'

describe Reply do
  pending "add some examples to (or delete) #{__FILE__}"
end
