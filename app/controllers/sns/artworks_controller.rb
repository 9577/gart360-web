class Sns::ArtworksController < ApplicationController
  inherit_resources

  main_nav_highlight :galleries
  sec_nav_highlight :galleries

  belongs_to :gallery

  before_filter :authenticate_user!, only: [ :new, :create, :edit, :update ]

  def create
    @artwork = end_of_association_chain.new artwork_params

    create! do |success, failure|
      success.html { redirect_to sns_gallery_path(parent) }
      failure.html { render :new }
    end
  end

  protected

  def artwork_params
    params.require(:artwork).permit!
  end
end
