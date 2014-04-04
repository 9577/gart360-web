class Weixin::ServiceController < ApplicationController
  layout 'weixin'

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality
  before_filter :parse_xml, :check_wechat_user, only: [:create]

  def verify
    render text: params[:echostr]
  end

  def create
    case @xml.MsgType
    when 'event'
      event_message
    when 'text'
      text_message
    else
      render 'help'
    end
  end

private
  # 根据参数校验请求是否合法，如果非法返回错误页面
  def check_weixin_legality
    render :text => "Forbidden", :status => 403 unless params[:timestamp] && params[:nonce] && params[:signature]
    array = [::WEIXIN_TOKEN, params[:timestamp], params[:nonce]].sort
    render :text => "Forbidden", :status => 403 if Digest::SHA1.hexdigest(array.join) != params[:signature]
  end

  def parse_xml
    @xml = OpenStruct.new params[:xml]
  end

  def check_wechat_user
    @wx_user = WxUser.find_or_create_by openid: @xml.FromUserName
  end

  def event_message
    case @xml.Event
    when 'subscribe' # 新关注用户
      render 'subscribe'
    # when 'location' # 当用户允许位置获取，微信系统每5秒上报一次地理位置
    #   location_event
    when 'CLICK' # 针对有自定义菜单的公众号
      click_handler
    end
  end

  def text_message
    render 'help'
  end

  def click_handler
    event_key = @xml.EventKey
    case event_key
    when 'bargain'
      @daily_item = DailyItem.current_item
      unless @daily_item.present?
        render "no_daily_item" and return
      end
    when 'mine'
    when 'pictorial'
    end
    render "#{event_key}"
  end
end
