class Admin::ProductsController < Admin::BaseController
  main_nav_highlight :auc
  sec_nav_highlight :products


  def create
    @product = end_of_association_chain.new(product_params)
    if @product.save!
      redirect_to collection_path
    else
      render 'new'
    end
  end

  def update
    if params.key?(:event)
      resource.send("#{params[:event]}!")
      redirect_to collection_path
    else
      if resource.update(product_params)
        redirect_to collection_path
      else
        render :edit
      end
    end
  end

  protected

  def collection
    @products ||= end_of_association_chain.order('created_at DESC').page(params[:page])
  end

  def product_params
    params.require(:product).permit!
  end
end
