class Weitou::AuctionsController < Weitou::BaseController
  main_nav_highlight :auc

  has_scope :filter_by_state

  def show
    @products = resource.products

    show!
  end

  protected

  def collection
    @auctions ||= end_of_association_chain.page(params[:page])
  end

end
