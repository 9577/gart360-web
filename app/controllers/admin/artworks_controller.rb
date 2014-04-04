class Admin::ArtworksController < Admin::BaseController
  main_nav_highlight :artwork
  sec_nav_highlight :artworks

  def update
    if resource.update_attributes artwork_params
      redirect_to collection_path
    else
      render :edit
    end
	end

  protected
  def artwork_params
  	params.require(:artwork).permit!
  end

  def collection
  	@artworks ||= end_of_association_chain.page(params[:page])
  end
end
