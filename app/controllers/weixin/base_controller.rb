class Weixin::BaseController < InheritedResources::Base
  layout 'wx'

  before_filter :current_wx_user, :oauth
  helper_method :current_wx_user

protected

  def oauth
    unless @current_wx_user
      cookies[:daily_item_url] = request.url
      auth_url = 'https://open.weixin.qq.com/connect/oauth2/authorize'
      appid = SERVICES['weixin']['api_key']
      redirect_uri = URI.encode(SERVICES['weixin']['redirect_uri'], /\W/)
      url = auth_url + '?' + "appid=#{appid}&redirect_uri=#{redirect_uri}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect"
      redirect_to url
    end
  end

  def current_wx_user
    return @current_wx_user if @current_wx_user.present?
    if params[:openid].present?
      @current_wx_user = WxUser.find_or_create_by openid: params[:openid]
      session["wx_user_openid"] = @current_wx_user.openid
      redirect_to request.url.split('?')[0]
    elsif session["wx_user_openid"].present?
      @current_wx_user = WxUser.find_by openid: session["wx_user_openid"]
    end
    @current_wx_user
  end
end