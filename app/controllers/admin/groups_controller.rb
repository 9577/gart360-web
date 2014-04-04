class Admin::GroupsController < Admin::BaseController
  main_nav_highlight :sns
  sec_nav_highlight :groups

  defaults resource_class: Group, collection_name: 'groups', instance_name: 'group'
  def update
    resource.update_attributes(group_params)
    update!{
      collection_path
    }
	end

  private

  def group_params
  	params.require(:group).permit!
  end

  def collection
  	end_of_association_chain.page(params[:page])
  end
end
