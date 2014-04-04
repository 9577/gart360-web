class Sns::ArtistsController < ApplicationController
  inherit_resources
  
  actions :create

  before_filter :authenticate_user!

  def create
    @artist = current_user.build_artist artist_params
  end

  protected

  def artist_params
    params.require(:artist).permit!
  end
end
