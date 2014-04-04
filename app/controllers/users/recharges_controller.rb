class Users::RechargesController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'weitou'

  sec_nav_highlight :account

  defaults resource_class: RechargeRecord, collection_name: 'recharge_records', instance_name: 'recharge_record'
  custom_actions resource: :check_payment, collection: :done

  before_filter :hide_subheader
  before_filter :set_state_processing, only: :show

  def create
    @recharge_record = end_of_association_chain.new(recharge_record_params)
    @recharge_record.user_id = current_user.id

    create! { recharge_path(@recharge_record) }
  end

  def check_payment
    if check_payment_params[:payment] == 'alipay'
      Order.create(user_id: resource.user_id, code: resource.code, price: resource.amount, target_type: resource.class.name, target_id: resource.id, type_identifier: :recharged)
      options = {
        :out_trade_no      => resource.code,
        :subject           => "玩意儿网 个人充值",
        :logistics_type    => 'DIRECT',
        :logistics_fee     => '0',
        :logistics_payment => 'SELLER_PAY',
        :price             => resource.amount,
        :quantity          => 1,
        :discount          => resource.discount,
        :return_url        => alipay_done_url,
        :notify_url        => alipay_notify_url
      }
      redirect_to Alipay::Service.create_direct_pay_by_user_url(options)
    end
  end

  private
  def recharge_record_params
    params.require(:recharge_record).permit(:amount)
  end

  def check_payment_params
    params.require(:check_payment).permit!
  end

  def set_state_processing
    resource.process! unless resource.processing?
  end
end
