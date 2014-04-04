class ProductCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper

  helper_method :current_user

  def related_products(args)
    @product = args[:product]
    @auction = @product.auction
    @products = @auction.products.limit(4)

    render
  end

end
