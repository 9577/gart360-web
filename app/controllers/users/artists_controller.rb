class Users::ArtistsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    @artist = current_user.build_artist artist_params

    create! do |format|
      format.js
    end
  end

  protected
  def resource
    @artist ||= current_user.artist
  end

  def artist_params
    params.require(:artist).permit!
  end
end
