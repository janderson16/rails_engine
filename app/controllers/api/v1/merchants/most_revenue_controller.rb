class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    render json: Merchant.most_revenue(most_revenue_params["quantity"])

  end

  def show
    if params[:date]
      render json: {"revenue" => Merchant.find(params[:id]).individual_revenue_by_date(params[:date])}, serializer: RevenueSerializer
    else
      render json: {"revenue" => Merchant.revenue(params[:id])},
    end
  end

  private

  def most_revenue_params
    params.permit(:quantity)
  end
end
