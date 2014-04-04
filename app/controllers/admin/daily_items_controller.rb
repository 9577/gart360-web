class Admin::DailyItemsController < Admin::BaseController
  main_nav_highlight :pc1_pc2
  sec_nav_highlight :daily_items

  def create
    end_of_association_chain.new(daily_item_params)
    create!{
      collection_path
    }
  end

  def update
    if resource.update!(daily_item_params)
      redirect_to collection_path
    else
      render 'edit'
    end
  end

  private
    def daily_item_params
      params.require(:daily_item).permit!
    end

    def collection
      end_of_association_chain.page(params[:page])
    end
end
