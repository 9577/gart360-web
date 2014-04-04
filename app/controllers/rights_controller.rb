class RightsController < ApplicationController
  inherit_resources
  defaults singleton: true
  optional_belongs_to :order
  layout 'weitou'

  sec_nav_highlight :right
  before_filter :hide_subheader

  custom_actions resource: [:add_description, :evaluate]

  def new
    @product = parent.product
    new!
  end

  def create
    end_of_association_chain.new(right_params)
    create!{
      collection_path
    }
  end

  def show
    @product = parent.product
    @descriptions = resource.descriptions
    show!
  end

  def update
    resource.close! unless resource.closed?
    redirect_to order_right_path(parent, resource)
  end

  def add_description
    resource.descriptions.create!(description_params)
    redirect_to order_right_path(parent, resource)
  end

  private
    def description_params
      params.require(:right_description).permit!
    end

    def right_params
      params.require(:right).permit!
    end

    def collection
      end_of_association_chain.page(params[:page])
    end
end
