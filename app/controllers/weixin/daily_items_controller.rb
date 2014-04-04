class Weixin::DailyItemsController < Weixin::BaseController
  custom_actions resource: [:room, :invitees]
  before_filter :create_inviter, only: :show

  def show
    redirect_to weixin_inviter_url(@inviter)
  end

  private
    def create_inviter
      @inviter = resource.inviters.find_or_create_by(wx_user_id: current_wx_user.id)
    end
end
