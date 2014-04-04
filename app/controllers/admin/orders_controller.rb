class Admin::OrdersController < Admin::BaseController
  main_nav_highlight :transaction
  sec_nav_highlight :orders

  actions :index, :update, :edit, :destroy
  custom_actions resource: :deliver

  respond_to :js, only: :deliver
  def update
    if params.key?(:event)
      resource.send("#{params[:event]}!")
    else
      resource.update(order_params)
      resource.deliver!
    end
    redirect_to collection_path
  end

  def deliver
    
  end
  protected
    def collection
      end_of_association_chain.page(params[:page])
    end

    def order_params
      params.require(:order).permit!
    end
end
