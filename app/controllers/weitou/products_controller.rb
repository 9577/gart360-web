class Weitou::ProductsController < Weitou::BaseController
  actions :show, :index
  custom_actions resource: [:want_bid, :check_bid, :not_enough, :check_payment]

  respond_to :js, only: :want_bid

  before_filter :hide_subheader, only: :not_enough

  has_scope :filter_by_type
  has_scope :filter_by_category
  has_scope :filter_by_state

  before_filter :authenticate_user!, except: [:show, :index, :want_bid]
  
  def index
    @sec_nav = params[:filter_by_type].try(:to_sym)

    params[:filter_by_category] ||= 'all'
    params[:filter_by_state] ||= 'all'

    index!
  end

  def want_bid
    session[:bid_price] = want_bid_params[:price]
    session[:bid_is_anonymous] = want_bid_params[:is_anonymous]
  end

  def check_bid
    if current_user.user_payment.amount >= resource.deposit || current_user.has_bid?(resource.id)
      redirect_to new_weitou_product_bid_path(resource)
    else
      redirect_to not_enough_weitou_product_path(resource)
    end
  end

  def not_enough
  end

  def check_payment
    if product_params[:payment] == 'alipay'
      @recharge_record = current_user.recharge_records.create(
        amount: resource.deposit - current_user.user_payment.amount, # 只充值相差的金币
        state: :processing
        )
      @recharge_record.build_order(
        user_id: @recharge_record.user_id, 
        code: @recharge_record.code, 
        price: @recharge_record.amount, 
        product_id: resource.id,
        type_identifier: :bid
        )
      @recharge_record.save

      options = {
        :out_trade_no      => @recharge_record.code,
        :subject           => "玩意儿网 竞拍定金充值",
        :logistics_type    => 'DIRECT',
        :logistics_fee     => '0',
        :logistics_payment => 'SELLER_PAY',
        :price             => @recharge_record.amount,
        :quantity          => 1,
        :discount          => 0,
        :return_url        => alipay_done_url,
        :notify_url        => alipay_notify_url
      }
      redirect_to Alipay::Service.create_direct_pay_by_user_url(options)
    end
  end

protected

  def collection
    @search = end_of_association_chain
    @products = @search.page params[:page]  
  end

  def want_bid_params
    params.require(:bid).permit!
  end

  def product_params
    params.require(:product).permit!
  end
end
