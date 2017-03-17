class Api::V1::Merchants::RevenueByDateController < ApplicationController

  def index
    render json: Merchant.revenue_by_date(revenue_by_date_params["date"])
  end

  private

  def revenue_by_date_params
    params.permit(:date)
  end
end
