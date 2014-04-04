class OrdersController < ApplicationController
  inherit_resources
  custom_actions resource: [:detail, :check_payment]
  layout 'weitou'
  before_filter :hide_subheader

  def show
    @product = resource.product
    show!
  end

  def detail
    @product = resource.product
  end

  def update
    if resource.update(order_params)
      redirect_to resource_path(resource)
    end
  end

  def confirmation
    resource.finish! unless resource.finished?
    redirect_to request.referrer
  end

  def check_payment
    if check_payment_params[:payment] == 'alipay'
      options = {
        :out_trade_no      => resource.code,
        :subject           => "竞拍付款",
        :logistics_type    => 'DIRECT',
        :logistics_fee     => '0',
        :logistics_payment => 'SELLER_PAY',
        :price             => resource.price,
        :quantity          => 1,
        :discount          => 0,
        :return_url        => alipay_done_url,
        :notify_url        => alipay_notify_url
      }
      redirect_to Alipay::Service.create_direct_pay_by_user_url(options)
    end
  end

  private
    def check_payment_params
      params.require(:check_payment).permit(:payment)
    end

    def order_params
      params.require(:order).permit(:address_id)
    end
end