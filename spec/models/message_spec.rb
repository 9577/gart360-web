# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe Message do
  pending "add some examples to (or delete) #{__FILE__}"
end
