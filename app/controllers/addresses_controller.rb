class AddressesController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!

  respond_to :js
  def create
    @address = current_user.addresses.create!(address_params)
  end

  private
    def address_params
      params.require(:address).permit!
    end
end
