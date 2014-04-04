class ValidationsController < ApplicationController

  def valid
    attr = params[:attr].to_sym
    if [:email, :username, :mobile].include? attr
      user = User.new user_params

      if attr == :mobile
        user.mobile_signup = true
      end

      # ignore current user info
      if (user_signed_in? && current_user.send(attr) == user_params[attr]) \
        or user.valid? or user.errors[attr].blank?
        render json: true.to_json
      else
        render json: user.errors[attr].join(',').to_json
      end
    else
      render json: { error: 'invalid params' }
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
