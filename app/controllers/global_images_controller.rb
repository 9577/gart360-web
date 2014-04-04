class GlobalImagesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json

  def create
    @image = GlobalImage.new
    @image.data = params[:image]
    @image.target_type = params[:page]
    @image.user = current_user
    @image.save!
  end

end
