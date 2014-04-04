# == Schema Information
#
# Table name: account_statements
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  amount          :decimal(20, 2)
#  type_identifier :string(255)
#  meta            :string(255)
#  description     :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe AccountStatement do
  pending "add some examples to (or delete) #{__FILE__}"
end
