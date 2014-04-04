class Admin::TopicsController < Admin::BaseController
  main_nav_highlight :sns
  sec_nav_highlight :topics

  defaults resource_class: Topic, collection_name: 'topics', instance_name: 'topic'
  def update
    resource.update_attributes(group_params)
    update!{
      collection_path
    }
	end

  private

  def group_params
  	params.require(:topic).permit!
  end

  def collection
  	end_of_association_chain.page(params[:page])
  end
end
