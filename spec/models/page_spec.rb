# == Schema Information
#
# Table name: pages
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  code            :string(255)
#  body            :text
#  type_identifier :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  position        :integer
#  area            :string(255)
#

require 'spec_helper'

describe Page do
  pending "add some examples to (or delete) #{__FILE__}"
end
