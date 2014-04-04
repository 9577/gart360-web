class UserMailer < ActionMailer::Base
  default from: "yixueming901216@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://www.gart360.com'
  	mail(:to => "#{user.username} <#{user.email}>", subject: 'welcome to gart360 ')
  end

  def notify(email)
    mail(to: email, subject: '支付成功了')
  end

  def notify_error(email)
    mail(to: email, subject: '支付失败了')
  end

  def notify_post(email)
    mail(to: email, subject: '.....')
  end
end
