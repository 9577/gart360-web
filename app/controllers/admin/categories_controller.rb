class Admin::CategoriesController < Admin::BaseController
  main_nav_highlight :auc
  sec_nav_highlight :categories

  custom_actions collection: [ :sort, :update_name ]

  def create
    @category = end_of_association_chain.new category_params
    if @category.save
      redirect_to collection_path
    else
      render 'index'
    end
  end

  def sort
    categories = {}
    params[:p].split(',').each_with_index { |id, index| categories[id] = { position: index + 1 } }

    Category.update categories.keys, categories.values
    render nothing: true
  end

  def update_name
    @category = Category.find(params[:category_id])
    @category.update_attribute(:name, params[:value])

    render nothing: true
  end

  protected

  def category_params
    params.require(:category).permit!
  end

  def collection
    @categories ||= Category.roots
  end
end
