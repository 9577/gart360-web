class AuctionCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper

  helper_method :current_user

  def home_active
    @active_auctions = Auction.active.limit(3)

    render
  end

  def home_pending
    @pending_auctions = Auction.pending.limit(3)

    render 
  end

  def home_zero
    @zero_products = Product.zero.limit(4)

    render
  end

  def home_charity
    @charity_products = Product.charity.limit(4)

    render
  end

end
