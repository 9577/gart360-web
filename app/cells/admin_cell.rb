class AdminCell < Cell::Rails
  append_view_path 'app/views/admin'

  include Devise::Controllers::Helpers

  def crumbs(args)
    @user = current_admin_user
    @main_nav, @sec_nav = args[:main_nav], args[:sec_nav]

    render
  end

  def right_header
    @user = current_admin_user

    render
  end

end
