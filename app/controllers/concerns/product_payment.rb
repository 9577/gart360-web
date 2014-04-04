module ProductPayment
  extend ActiveSupport::Concern

  def want_bid
    session[:bid_price] = want_bid_params[:price]
    session[:bid_is_anonymous] = want_bid_params[:is_anonymous]
  end

  def check_bid
    begin
      if current_user.user_payment.amount >= resource.deposit || current_user.has_bid?(resource.id)
        redirect_to new_weitou_product_bid_path(resource)
      else
        redirect_to not_enough_weitou_product_path(resource)
      end
    rescue Exception => e
      redirect_to resource_path(resource)
    end
  end

  def not_enough; end

  def check_payment
    if product_params[:payment] == 'alipay'
      redirect_to alipay_payment_weitou_product_path(resource)
    end
  end

  def alipay_payment
    @recharge_record = current_user.recharge_records.create!(
        amount: resource.deposit - current_user.user_payment.amount # 只充值相差的金币
        )
    options = {
      :out_trade_no      => @recharge_record.code,
      :subject           => "玩意儿网 竞拍定金充值",
      :logistics_type    => 'DIRECT',
      :logistics_fee     => '0',
      :logistics_payment => 'SELLER_PAY',
      :price             => @recharge_record.amount,
      :quantity          => 1,
      :discount          => 0,
      :return_url        => alipay_done_weitou_product_url(resource, recharge_record_id: @recharge_record),
      :notify_url        => alipay_notify_weitou_product_url(resource, recharge_record_id: @recharge_record)
    }
    @recharge_record.process!
    redirect_to Alipay::Service.create_direct_pay_by_user_url(options)
  end

  def alipay_done
    @recharge_record = RechargeRecord.find(params[:recharge_record_id])
    notify_params = params.except(*(request.path_parameters.keys << :recharge_record_id))
    Alipay::Notify.verify?(notify_params)
    if Alipay::Notify.verify?(notify_params)
      @recharge_record.finish! unless @recharge_record.finished?
      redirect_to new_weitou_product_bid_path(resource)
    else
      redirect_to root_path, alert: '重置失败, 请重新尝试, 或者联系我们的客服人员, 谢谢!'
    end
  end

  def alipay_notify
    @recharge_record = RechargeRecord.find(params[:recharge_record_id])
    notify_params = params.except(*(request.path_parameters.keys << :recharge_record_id))
    if Alipay::Notify.verify?(notify_params)
      @recharge_record.finish! unless @recharge_record.finished?
      render text: 'success'
    else
      render text: 'error'
    end
  end
end