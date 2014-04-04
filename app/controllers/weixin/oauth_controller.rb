class Weixin::OauthController < ApplicationController
  def callback
    if params[:code]
      appid = SERVICES['weixin']['api_key']
      secret = SERVICES['weixin']['api_secret']
      code = params[:code]
      authentication = get_access_token appid, secret, code
      get_user_info authentication
      logger.info '**********************'
      logger.info @current_wx_user.inspect
      logger.info '----------------------'
      logger.info cookies[:daily_item_url]
      redirect_to cookies[:daily_item_url] if @current_wx_user && cookies[:daily_item_url].present?
    end
  end

protected

  def get_access_token appid, secret, code
    baseurl = 'https://api.weixin.qq.com/sns/oauth2/access_token'
    url = baseurl + "?appid=#{appid}&secret=#{secret}&code=#{code}&grant_type=authorization_code"
    response = Faraday.get url
    body = JSON.parse response.body
    if body['access_token']
      authentication = WxAuthentication.find_or_initialize_by openid: body['openid']
      authentication.attributes = ({
        access_token:  body['access_token'],
        refresh_token: body['refresh_token'],
        scope:         body['scope']
      })
      authentication.save
    end
    authentication
  end

  def get_user_info authentication
    response = Faraday.get "https://api.weixin.qq.com/sns/userinfo?access_token=#{authentication.access_token}&openid=#{authentication.openid}&lang=zh_CN"
    body = JSON.parse response.body
    wx_user = WxUser.find_or_initialize_by openid: body['openid']
    wx_user.attributes = ({
      nickname:   body['nickname'],
      sex:        body['sex'],
      province:   body['province'],
      city:       body['city'],
      country:    body['country'],
      headimgurl: body['headimgurl']
    })
    wx_user.save
    session["wx_user_openid"] = wx_user.openid
    @current_wx_user = wx_user
  end
end
