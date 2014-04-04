class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery #with: :exception

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  class << self
    def main_nav_highlight(name)
      before_filter { |c| c.instance_variable_set(:@main_nav, name) }
    end

    def sec_nav_highlight(name)
      before_filter { |c| c.instance_variable_set(:@sec_nav, name) }
    end
  end

  def hide_subheader
    @hide_subheader = true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :mobile_phone, :mobile_signup) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :username, :gender, :province_id, :city_id, :birthdate, :bio, :avatar, :intrest_list) }

  end
end
