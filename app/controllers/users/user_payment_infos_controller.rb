class Users::UserPaymentInfosController < InheritedResources::Base
  layout 'weitou'
  actions :edit, :update
  defaults resource_class: UserPayment, instance_name: 'user_payment'

  sec_nav_highlight :account

  before_filter :authenticate_user!, :hide_subheader

  protected

  def resource
    @user_payment ||= current_user.user_payment
  end

  def user_payment_info
    params.require(:user_payment).require(:payment_password)
  end

end
