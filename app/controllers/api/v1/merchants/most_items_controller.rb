class Api::V1::Merchants::MostItemsController < ApplicationController

  def index
    render json: Merchant.most_items(most_items_params["quantity"])
  end

  private

  def most_items_params
    params.permit(:quantity)
  end
end
