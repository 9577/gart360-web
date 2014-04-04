class Users::WithdrawsController < InheritedResources::Base
  layout 'weitou'
  sec_nav_highlight :account

  actions :new, :create, :index, :show

  before_filter :authenticate_user!, :hide_subheader

  defaults resource_class: Withdraw, collection_name: 'withdraws', instance_name: 'withdraw'

  custom_actions resource: :finish

  def create
    @withdraw = end_of_association_chain.new(withdraw_params)
    @withdraw.user_id = current_user.id
    create!{
      withdraws_path
    }
  end

  def finish
    resource.finish! unless resource.finished?
    redirect_to withdraw_path(resource)
  end

  private
    def withdraw_params
      params.require(:withdraw).permit!
    end

    def collection
      default_hash = { 'time' => 'all', 'state' => 'all' }
      hash = default_hash.merge(request.GET)
      end_of_association_chain.by_hash(hash).page(params[:page])
    end

end
