class SnsBaseController < ApplicationController
  before_action :authenticate_user!

  # before_action :conpelte_url

  # # 检查信息是否完善
  # def conpelte_url
  #   unless current_user.nil?
  #     if current_user.userinfo_complete == 0
  #       redirect_to new_user_info_path unless request.original_fullpath == new_user_info_path ||
  #        (request.original_fullpath == user_infos_path && request.post?) || #
  #        (request.original_fullpath == area_user_infos_path) ||
  #        request.original_fullpath.split('?').include?(area_user_infos_path) ||
  #        request.original_fullpath == destroy_user_session_path && request.delete?
  #     end
  #   end
  # end
end