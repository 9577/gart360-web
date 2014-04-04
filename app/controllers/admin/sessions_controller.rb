class Admin::SessionsController < Devise::SessionsController
  layout 'admin'

  before_filter :set_body_class

  def set_body_class
    @body_class = :login
  end

  private

  def after_sign_in_path_for(resource)
    admin_root_path
  end
end
