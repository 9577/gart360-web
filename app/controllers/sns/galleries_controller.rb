class Sns::GalleriesController < ApplicationController
  inherit_resources

  main_nav_highlight :galleries
  sec_nav_highlight :my

  before_filter :authenticate_user!, only: [ :new, :create, :edit, :update ]

  def index
    if params.key?(:filter_by_tag)
      @sec_nav = params[:filter_by_tag].to_url.to_sym
      @artworks = Artwork.page(params[:page])
    else
      @sec_nav = :galleries
      
      @featured_gallery_groups = Gallery.featured.limit(12).each_slice(3)
      @featured_artworks = Artwork.featured.limit(3)
    end
  end

  def show
    @sec_nav = :galleries

    show!
  end

  def create
    @gallery = end_of_association_chain.new gallery_params
    @gallery.user = current_user

    create! do |success, failure|
      success.html {
        flash[:notice] = '恭喜，手工艺廊已创建成功！'
        redirect_to new_sns_gallery_artwork_path(resource)
      }
      failure.html {
        render :new
      }
    end
  end

  def update
    if resource.update_attributes gallery_params
      redirect_to resource_path(resource)
    else
      render :edit
    end
  end

  protected

  def gallery_params
    params.require(:gallery).permit!
  end
end
