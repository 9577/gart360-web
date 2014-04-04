# == Schema Information
#
# Table name: rights
#
#  id                 :integer          not null, primary key
#  order_id           :integer
#  is_received        :boolean          default(FALSE)
#  type_identifier    :string(255)
#  certificates_count :integer          default(0)
#  created_at         :datetime
#  updated_at         :datetime
#  is_satisfied       :boolean
#  state              :string(255)
#

require 'spec_helper'

describe Right do
  pending "add some examples to (or delete) #{__FILE__}"
end
