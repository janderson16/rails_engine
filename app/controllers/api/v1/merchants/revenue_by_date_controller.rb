class Api::V1::Merchants::RevenueByDateController < ApplicationController

  def index
    render json: {"total_revenue" => (Merchant.revenue_by_date(revenue_by_date_params["date"]).to_f / 100).to_s}, serialize: MerchantSerializer
  end

  private

  def revenue_by_date_params
    params.permit(:date)
  end
end
