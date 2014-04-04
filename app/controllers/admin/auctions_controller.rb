class Admin::AuctionsController < Admin::BaseController
  main_nav_highlight :auc
  sec_nav_highlight :auctions
  
  before_filter :find_resource, only: [:start, :close, :restart, :switch_pick]

  def create
    end_of_association_chain.new(auction_params)
    create!{
      collection_path
    }
  end

  def update
    if params.key?(:event)
      resource.send("#{params[:event]}!")
      redirect_to :back
    else
      if resource.update(auction_params)
        redirect_to collection_path
      else
        render :edit
      end
    end
  end

  private
    def collection
      end_of_association_chain.page(params[:page])
    end

    def auction_params
      params.require(:auction).permit!
    end

    def find_resource
      @auction = Auction.find(params[:auction_id])
    end
end
