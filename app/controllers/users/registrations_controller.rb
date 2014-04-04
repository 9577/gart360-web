class Users::RegistrationsController < Devise::RegistrationsController

  def send_sms
    if (params[:mobile_phone]=~/^1[3|5][0-9]\d{4,8}$/)!=0
      render json: { error: 'mobile_phone_incorrect' }
    else
      phone = params[:mobile_phone]
      begin
        Sms.new.send(phone)
        render json: { success: true }
      rescue Exception => e
        render json: { error: true, msg: e.message }
      end
    end
  end

  def validate_captcha
    if Captcha.find_by(captcha: params[:captcha])
      logger.info '############## true'

      render json: { success: true }
    else
      logger.info '@@@@@@@@@@@@@@@@@false'
      render json: { error: true }
    end
  end

  def new
    params[:type] ||= :email
    @sec_nav = params[:type].to_sym
    super
  end

  # def create
  #   build_resource(sign_up_params)

  #   if resource.save!
  #     session[:signup_user_id] = resource.id

  #     if resource.active_for_authentication?
  #       set_flash_message :notice, :signed_up if is_navigational_format?
  #       sign_up(resource_name, resource)
  #       respond_with resource, :location => after_sign_up_path_for(resource)
  #     else
  #       set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
  #       expire_session_data_after_sign_in!
  #       # respond_with resource, :location => after_inactive_sign_up_path_for(resource)
  #     end
  #   else
  #     clean_up_passwords resource
  #     redirect_to sign_up_path(type: params[:type])
  #   end
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with sign_up_path(type: params[:type])
    end
  end

  def edit
    @sev_nav = :settings

    super
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)


    successfully_updated = if needs_password?
      resource.update_with_password account_update_params
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      account_update_params.delete(:current_password)
      resource.update_without_password account_update_params
    end

    if successfully_updated
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      # respond_with resource, :location => after_update_path_for(resource)

      respond_to do |format|
        format.html { redirect_to after_update_path_for(resource) }
        format.js
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def needs_password?
    params[:type] == 'password'
  end

  # def update
  #   @user = User.find(current_user.id)
  #   if @user.update_attributes(user_params)
  #     sign_in @user, :bypass => true
  #     render json: {res: @user.username}
  #   else
  #     render json: {res: render_to_string(partial: "users/registrations/settings/basic"), type: false}
  #   end

  # end

  # def create
  #   build_resource(sign_up_params)

  #   if resource.save
  #     session[:signup_user_id] = resource.id

  #     if resource.active_for_authentication?
  #       set_flash_message :notice, :signed_up if is_navigational_format?
  #       sign_up(resource_name, resource)
  #       respond_with resource, :location => after_sign_up_path_for(resource)
  #     else
  #       set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
  #       expire_session_data_after_sign_in!
  #       respond_with resource, :location => after_inactive_sign_up_path_for(resource)
  #     end
  #   else
  #     clean_up_passwords resource

  #     render :new, type: params[:type]
  #   end
  # end

  private
  def user_params
    params.require(:user).permit!
  end
end
