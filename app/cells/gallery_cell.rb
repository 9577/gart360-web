class GalleryCell < Cell::Rails
  append_view_path 'app/views'

  include Devise::Controllers::Helpers

  helper ApplicationHelper
  helper_method :current_user

  def popular_artists
    render
  end

  ## 热门作品
  ## 取本周内新增喜欢数量最多的作品，取作品封面、作品名称。
  def popular_artworks
    @artworks = Artwork.all.sample(3)
    
    render
  end

end
