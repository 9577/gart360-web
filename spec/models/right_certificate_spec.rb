# == Schema Information
#
# Table name: right_certificates
#
#  id         :integer          not null, primary key
#  right_id   :integer
#  image      :string(255)
#  position   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe RightCertificate do
  pending "add some examples to (or delete) #{__FILE__}"
end
