class Admin::ExpertsController < Admin::BaseController
  main_nav_highlight :user
  sec_nav_highlight :experts
  def create
    end_of_association_chain.new(expert_params)
    create!{
      collection_path
    }
  end

  def update
    if resource.update_attributes(expert_params)
      redirect_to collection_path
    else
      render 'edit'
    end
  end

  def sort
    experts = {}
    params[:p].split(',').each_with_index { |id, index| experts[id] = { position: index + 1 } }

    Expert.update experts.keys, experts.values
    render nothing: true
  end

  def rename
    @expert = Expert.find(params[:expert_id])
    @expert.update_attribute(:name, params[:value])

    render nothing: true
  end

  private
    def expert_params
      params.require(:expert).permit!
    end
end
