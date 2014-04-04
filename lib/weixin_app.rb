module WeixinApp
  extend self
  def create_remote_menu
    conn = get_conn

    conn.post do |req|
      req.url "/cgi-bin/menu/create?access_token=#{get_access_token}"
      req.headers['Content-Type'] = 'application/json'
      req.body = build_menus
    end
  end

  def build_menus
    Jbuilder.encode do |json|
      json.set! :button do
        json.array! WeixinMenu.all do |menu|
          json.name menu.name

          if menu.weixin_sub_menus.present?
            json.set! :sub_button do
              json.array! menu.weixin_sub_menus do |sub_menu|
                json.name sub_menu.name
                json.type sub_menu.menu_type
                if sub_menu.menu_type == 'click'
                  json.key  sub_menu.key
                else
                  json.url  sub_menu.url
                end
              end
            end
          else
            json.type menu.menu_type
            if menu.menu_type == 'click'
              json.key  menu.key
            else
              json.url  menu.url
            end
          end
        end
      end
    end
  end

  def load_default
    WeixinMenu.create({
      name: '菜单/外卖', sequence: 1,
      weixin_sub_menus_attributes: [
        {menu_type: 'click', name: '菜单',    key: 'menus'},
        {menu_type: 'click', name: '外卖',    key: 'takeout'},
        {menu_type: 'click', name: '绑定手机', key: 'stores'}
      ]
    })
    WeixinMenu.create({
      name: '我', sequence: 2,
      weixin_sub_menus_attributes: [
        {menu_type: 'view', name: '个人中心', url: '#'},
        {menu_type: 'view', name: '我的外卖', url: '#'},
        {menu_type: 'view', name: '我的订单', url: '#'}
      ]
    })

    WeixinMenu.create({
      name: '资讯', sequence: 3,
      weixin_sub_menus_attributes: [
        {menu_type: 'click', name: '帮助信息', key: 'help'},
        {menu_type: 'click', name: '绑定手机', key: 'membership'}
      ]
    })
  end

  def get_current_menus
    url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=#{get_access_token}"
    response = Faraday.get url
    body = JSON.parse response.body
  end

  def load_remote_menus
    button_arr = get_current_menus['menu']['button']
    WeixinMenu.destroy_all if button_arr.present?
    button_arr.each_with_index do |butn, index|
      if butn['sub_button'].present?
        menu = WeixinMenu.create butn.except('sub_button').merge(sequence: index)
        butn['sub_button'].each_with_index do |sub_menu, index|
          menu.weixin_sub_menus.create sub_menu.except('sub_button', 'type').merge(menu_type: sub_menu['type'], sequence: index)
        end
      else
        menu = WeixinMenu.create butn.except('sub_button', 'type').merge(menu_type: butn['type'], sequence: index)
      end
    end
  end

  def get_access_token
    url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{WEIXIN_ID}&secret=#{WEIXIN_SECRET}"
    response = Faraday.get url
    body = JSON.parse response.body

    return body["access_token"]
  end

  def get_conn
    conn = Faraday.new(:url => "https://api.weixin.qq.com/") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end