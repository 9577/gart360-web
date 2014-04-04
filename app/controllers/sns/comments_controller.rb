class Sns::CommentsController < InheritedResources::Base
  actions :create

  optional_belongs_to :artwork

  respond_to :js

  def create
    @comment = end_of_association_chain.new comment_params
    @comment.user = current_user

    create!
  end

  protected

  def comment_params
    params.require(:comment).permit!
  end
end
