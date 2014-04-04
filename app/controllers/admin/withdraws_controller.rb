class Admin::WithdrawsController < Admin::BaseController
  main_nav_highlight :transaction
  sec_nav_highlight :withdraws

  actions :update, :index

  def update
    if params.key?(:event)
      resource.send("#{params[:event]}!")
    end
    redirect_to collection_path
  end

  private
    def collection
      end_of_association_chain.page(params[:page])
    end
end
