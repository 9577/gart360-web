# == Schema Information
#
# Table name: ads
#
#  id              :integer          not null, primary key
#  area            :string(255)
#  position        :integer          default(1)
#  type_identifier :string(255)
#  title           :string(255)
#  body            :text
#  image           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  url             :string(255)
#

require 'spec_helper'

describe Ad do
  pending "add some examples to (or delete) #{__FILE__}"
end
