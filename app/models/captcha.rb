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

class Captcha < ActiveRecord::Base

end
