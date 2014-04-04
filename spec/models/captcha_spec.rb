# == Schema Information
#
# Table name: captchas
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  captcha         :string(255)
#  captcha_sent_at :datetime
#  mobile_phone    :string(255)
#

require 'spec_helper'

describe Captcha do
  pending "add some examples to (or delete) #{__FILE__}"
end
