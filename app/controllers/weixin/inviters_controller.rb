class Weixin::InvitersController < Weixin::BaseController
  defaults resource_class: DailyItemInviter, collection_name: 'daily_item_inviters', instance_name: 'daily_item_inviter'
  custom_actions resource: :cut
  respond_to :js, only: :cut

  def cut
    unless current_wx_user.inviter?(resource.wx_user_id)
      @invitee = if resource.invitees.find_by(wx_user_id: current_wx_user.id)
        false
      else
        resource.invitees.create(wx_user_id: current_wx_user.id)
      end
    end
  end
end
