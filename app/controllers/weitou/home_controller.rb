class Weitou::HomeController < Weitou::BaseController
  main_nav_highlight :auc

  has_scope :filter_by_category

  def index
    @banners = Ad.auction_slider
  end

  def zero
    @products = Product.zero.page(params[:page])
  end

  def charity
    @products = Product.charity.page(params[:page])
  end
end
