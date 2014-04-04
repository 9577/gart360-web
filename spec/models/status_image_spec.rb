# == Schema Information
#
# Table name: status_images
#
#  id         :integer          not null, primary key
#  status_id  :integer
#  data       :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe StatusImage do
  pending "add some examples to (or delete) #{__FILE__}"
end
