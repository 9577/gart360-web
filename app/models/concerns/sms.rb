## Sns.new.send('18616386885')

class Sms

  # def get_verify_code
  #   rand(100000..999999) if Captcha.find_by_captcha(code).nil?
  # end

  def get_verify_code
    randoms = Set.new

    loop do
      randoms << rand(9)
      code = randoms.to_a.join
      return code if randoms.size >= 6 && Captcha.find_by(captcha: code).nil?
    end
  end


  def send(phone)
    code = get_verify_code
    content = "欢迎加入玩艺儿，您的验证码是(#{code})"

    captcha = Captcha.find_or_initialize_by(mobile_phone: phone)
    captcha.captcha = code
    captcha.captcha_sent_at = Time.zone.now
    captcha.save!

    ChinaSMS.use :tui3, username: Settings.sms.tui3.username, password: Settings.sms.tui3.password
    ChinaSMS.to phone, content
  end

end