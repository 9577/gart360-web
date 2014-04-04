class PaymentPasswordsController < ApplicationController
  include Wicked::Wizard
  layout 'weitou'
  steps :query_mobile, :set_password, :finish
  before_filter :authenticate_user!, :hide_subheader

  def show
    case step
    when :query_mobile

    when :set_password
      @user_payment = current_user.user_payment
    when :finish

    end
    render_wizard
  end

  def update
    case step
    when :query_mobile
      redirect_to next_wizard_path
    when :set_password
      if validate?(user_payment_params)
        @user_payment = current_user.user_payment
        @user_payment.password = user_payment_params[:password]
        redirect_to @user_payment.save ? next_wizard_path : wizard_path
      else
        redirect_to wizard_path
      end
    end
  end

  private
    def user_payment_params
      params.require(:user_payment).permit!
    end

    def validate?(params)
      !params[:password].empty? && params[:password] == params[:password_confirmation]
    end
end
