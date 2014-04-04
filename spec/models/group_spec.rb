# == Schema Information
#
# Table name: groups
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  logo                :string(255)
#  is_confirm_required :boolean          default(FALSE)
#  topics_count        :integer          default(0)
#  members_count       :integer          default(0)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  is_recommended      :boolean          default(FALSE)
#

require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end
