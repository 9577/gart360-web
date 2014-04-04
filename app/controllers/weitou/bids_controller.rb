class Weitou::BidsController < Weitou::BaseController
  optional_belongs_to :product

  def create
    @bid = end_of_association_chain.new(bid_params)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to weitou_product_path(parent)
    else
      redirect_to not_enough_weitou_product_path(parent)
    end
  end

  def update
    if params.key?(:delete)
      if resource.update!(is_deleted: true)
        redirect_to weitou_my_closed_products_path
      end
    end
  end

  private
    def bid_params
      params.require(:bid).permit!
    end
end