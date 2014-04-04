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

class UserPayment < ActiveRecord::Base
  include PaymentAuthenticatable

  belongs_to :user


  class << self
    def pepper
      SecureRandom.hex(64)
    end

    def stretches
      Rails.env.test? ? 1 : 10
    end
  end
end
