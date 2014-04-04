class Admin::PagesController < Admin::BaseController
  main_nav_highlight :basic
  sec_nav_highlight :pages

  def create
    @page = end_of_association_chain.new page_params
    create! { collection_path }
  end

  def update
    if resource.update_attributes page_params
      redirect_to collection_path
    else
      render :edit
    end
  end

  protected

  def collection
    @q = end_of_association_chain.search(params[:search])
    @pages ||= @q.result(distinct: true).page(params[:page])
  end

  def page_params
    params.require(:page).permit!
  end
end
