class Weitou::ProfilesController < Weitou::BaseController

  before_filter :authenticate_user!, :hide_subheader

  ## 我的保证金
  def deposits
    @sec_nav = :deposits
    @deposits = current_user.deposits.page(params[:page])
    @total_amount_freezed = @deposits.total_amount_freezed
  end

  ## 我的竞拍订单
  def orders
    @sec_nav = :orders
    @orders = current_user.orders.auction
  end

  ## 正在竞拍的拍品
  def active_products
    @sec_nav = :active_products
    @bids = current_user.bids.active_products
  end

  ## 竞拍结束的拍品
  def closed_products
    @sec_nav = :closed_products
    @bids = current_user.bids.closed_products.exist
  end
end
