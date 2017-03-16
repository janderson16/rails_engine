class Api::V1::Merchants::MostRevenueMerchantsController < ApplicationController

  def index
    render json: Merchant.most_revenue(most_revenue_params["quantity"])
  end

  private

  def most_revenue_params
    params.permit(:quantity)
  end
end
