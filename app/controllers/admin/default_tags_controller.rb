class Admin::DefaultTagsController < Admin::BaseController
  main_nav_highlight :sns
  sec_nav_highlight :default_tags

  custom_actions collection: [ :sort, :update_name ]

  def create
    @default_tag = end_of_association_chain.new default_tag_params
    if @default_tag.save
      redirect_to collection_path
    else
      render 'index'
    end
  end

  def sort
    default_tags = {}
    params[:p].split(',').each_with_index { |id, index| default_tags[id] = { position: index + 1 } }
    DefaultTag.update default_tags.keys, default_tags.values
    render nothing: true
  end

  def update_name
    @default_tag = DefaultTag.find(params[:default_tag_id])
    @default_tag.update_attribute(:name, params[:value])

    render nothing: true
  end

  protected

  def default_tag_params
    params.require(:default_tag).permit!
  end

  def collection
    @default_tags ||= DefaultTag.roots
  end
end
