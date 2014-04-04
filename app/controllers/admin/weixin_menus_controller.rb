class Admin::WeixinMenusController < Admin::BaseController
  main_nav_highlight :weixin
  sec_nav_highlight :weixin_menus

  defaults resource_class: WeixinMenu, collection_name: 'weixin_menus', instance_name: 'weixin_menu'

  def create
    create! do |success, failure|
      success.html { redirect_to admin_weixin_menus_path }
      failure.html { render :new }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to admin_weixin_menus_path }
      failure.html { render :edit }
    end
  end

  def load_default
    WeixinApp.load_default
    redirect_to admin_weixin_menus_path(@instance)
  end

  def sync
    response = WeixinApp.create_remote_menu
    body = JSON.parse response.body

    if body['errcode'] == 0
      flash[:notice] = '同步成功'
    else
      flash[:alert] = "#{body['errcode']}, #{body['errmsg']}"
    end
    redirect_to admin_weixin_menus_path
  end

private

  def weixin_menu_params
    params.require(:weixin_menu).permit!
  end

  def collection
    end_of_association_chain.page(params[:page])
  end
end
