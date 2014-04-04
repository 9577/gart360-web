class Admin::EventsController < Admin::BaseController
  main_nav_highlight :sns
  sec_nav_highlight :events

  defaults resource_class: Event, collection_name: 'events', instance_name: 'event'
  def update
    resource.update_attributes(group_params)
    update!{
      collection_path
    }
	end

  private

  def group_params
  	params.require(:event).permit!
  end

  def collection
  	end_of_association_chain.page(params[:page])
  end
end
