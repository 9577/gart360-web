# == Schema Information
#
# Table name: experts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  avatar      :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer          default(1)
#

require 'spec_helper'

describe Expert do
  pending "add some examples to (or delete) #{__FILE__}"
end
