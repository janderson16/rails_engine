class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: Merchant.most_revenue(most_revenue_params["quantity"])

  end

  def show
      render json: {"revenue" => Merchant.revenue(params[:id])}

  end

  private

  def most_revenue_params
    params.permit(:quantity)
  end
end
