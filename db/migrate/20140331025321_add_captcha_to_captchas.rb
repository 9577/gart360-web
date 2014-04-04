class AddCaptchaToCaptchas < ActiveRecord::Migration
  def change
    add_column :captchas, :captcha, :string
    add_column :captchas, :captcha_sent_at, :datetime

    remove_column :captchas, :mobile
    add_column :captchas, :mobile_phone, :string
  end
end
