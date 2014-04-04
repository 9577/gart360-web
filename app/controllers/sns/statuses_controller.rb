class Sns::StatusesController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    @status = end_of_association_chain.new status_params

    create! do |format|
      format.js
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def status_params
    params.require(:status).permit!
  end
end
