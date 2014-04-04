class Admin::EpisodesController < Admin::BaseController
  main_nav_highlight :pc1_pc2
  sec_nav_highlight :episodes

  def create
    end_of_association_chain.new(episode_params)
    create!{
      collection_path
    }
  end

  def update
    if resource.update(episode_params)
      redirect_to collection_path
    else
      render 'edit'
    end
  end

  private
    def collection
      end_of_association_chain.page(params[:page])
    end

    def episode_params
      params.require(:episode).permit!
    end
end
