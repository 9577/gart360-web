class Users::SessionsController < Devise::SessionsController

  private

  def after_sign_in_path_for(resource)
    if resource.is_profile_completed?
      super
    else
      edit_user_registration_path(type: :complete_profile)
    end
  end
end
