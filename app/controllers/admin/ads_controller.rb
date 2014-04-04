class Admin::AdsController < Admin::BaseController
  main_nav_highlight :basic
  sec_nav_highlight :ads

  def create
    @ad = end_of_association_chain.new(ad_params)
    if @ad.save!
      redirect_to collection_path
    end
  end

  def update
    if resource.update_attributes(ad_params)
      redirect_to collection_path
    end
  end

  private
    def ad_params
      params.require(:ad).permit!
    end

    def collection
      end_of_association_chain.page(params[:page])
    end
end
