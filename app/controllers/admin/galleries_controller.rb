class Admin::GalleriesController < Admin::BaseController
  main_nav_highlight :sns
  sec_nav_highlight :galleries

  def update
    if params.key?(:event)
      resource.send("#{params[:event]}!")
      
      redirect_to :back
    else
      if resource.update_attributes gallery_params
        redirect_to collection_path
      else
        render :edit
      end
    end
  end

  private

  def gallery_params
  	params.require(:gallery).permit!
  end

  def collection
  	end_of_association_chain.page(params[:page])
  end
end
