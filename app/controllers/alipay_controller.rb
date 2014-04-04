class AlipayController < ApplicationController
  before_filter :find_order

  def done
    if Alipay::Notify.verify?(notify_params)
      @order.pay! unless @order.paid?
      if @order.recharged?
        redirect_to done_recharges_path
      elsif @order.bid?
        redirect_to new_weitou_product_bid_path(@order.product_id)
      else
        # redirect_to some_path to show that you have paid.
      end
    else
      redirect_to root_path, alert: '重置失败, 请重新尝试, 或者联系我们的客服人员, 谢谢!'
    end
  end

  def notify
    if Alipay::Notify.verify?(notify_params)
      @order.pay! unless @order.paid?
      render text: 'success'
    else
      render text: 'error'
    end
  end

  private
    def find_order
      @order = Order.find_by(code: params['out_trade_no'])
    end

    def notify_params
      params.except(*request.path_parameters.keys)
    end
end
