# == Schema Information
#
# Table name: group_users
#
#  id           :integer          not null, primary key
#  group_id     :integer
#  user_id      :integer
#  is_confirmed :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe GroupUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
