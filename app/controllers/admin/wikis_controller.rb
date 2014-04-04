class Admin::WikisController < Admin::BaseController
  main_nav_highlight :wiki
  sec_nav_highlight :wikis

  def create
    end_of_association_chain.new(wiki_params)
    create!{
      collection_path
    }
  end

  def update
    if resource.update(wiki_params)
      redirect_to collection_path
    else
      render 'edit'
    end
  end

  private 
    def collection
      end_of_association_chain.page(params[:page])
    end

    def wiki_params
      params.require(:wiki).permit!
    end
end
