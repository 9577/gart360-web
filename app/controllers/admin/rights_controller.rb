class Admin::RightsController < Admin::BaseController
  main_nav_highlight :transaction
  sec_nav_highlight :rights

  custom_actions resource: [:respond_commit, :respond]

  before_filter :find_last_description, only: [:respond, :respond_commit]
  respond_to :js, only: :respond
  def update
    resource.update_attributes!(right_params)
  end

  def show
    @order = resource.order
    show!
  end

  def respond
  end

  def respond_commit
    @description.update(description_params)
    redirect_to resource_path(resource)
  end

  private
    def right_params
      params.require(:right).permit!
    end

    def collection
      end_of_association_chain.page(params[:page])
    end

    def description_params
      params.require(:right_description).permit!
    end

    def find_last_description
      @description = resource.descriptions.last
    end
end
