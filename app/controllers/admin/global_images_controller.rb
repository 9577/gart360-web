class Admin::GlobalImagesController < ApplicationController
  before_filter :authenticate_admin_user!
  respond_to :json

  def create
    @image = GlobalImage.new
    @image.data = params[:image]

    @image.save!
  end

end
