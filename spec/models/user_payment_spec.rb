# == Schema Information
#
# Table name: user_payments
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  encrypted_password :string(255)
#  amount             :decimal(20, 2)   default(0.0)
#  coin               :integer          default(0)
#  created_at         :datetime
#  updated_at         :datetime
#  freezing_amount    :decimal(20, 2)   default(0.0)
#

require 'spec_helper'

describe UserPayment do
  pending "add some examples to (or delete) #{__FILE__}"
end
