class Admin::CollectionItemsController < Admin::BaseController
  main_nav_highlight :pc1_pc2
  sec_nav_highlight :collection_items

  def update
    if params.key?(:actions)
      resource.send("#{params[:actions]}!")
      redirect_to collection_path
    else
      if resource.update(collection_item_params)
        redirect_to collection_path
      else
        render 'edit'
      end
    end
  end

  private
    def collection
      end_of_association_chain.page(params[:page])
    end

    def collection_item_params
      params.require(:collection_item).permit!
    end
end
