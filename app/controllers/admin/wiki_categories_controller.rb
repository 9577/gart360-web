class Admin::WikiCategoriesController < Admin::BaseController
  main_nav_highlight :wiki
  sec_nav_highlight :wiki_categories

  def create
    end_of_association_chain.new(wiki_category_params)
    create!{
      collection_path
    }
  end

  def update
    if resource.update(wiki_category_params)
      redirect_to collection_path
    else
      render 'edit'
    end
  end

  private
    def wiki_category_params
      params.require(:wiki_category).permit!
    end
end
