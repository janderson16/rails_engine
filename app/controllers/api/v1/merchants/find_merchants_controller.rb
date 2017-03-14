class Api::V1::Merchants::FindMerchantsController < ApplicationController

  def show
    render json: Merchant.find_by(params[:find_merchant_params])
  end

  def index
    render json: Merchant.where(params[:find_merchants_params])
  end

  private

  def find_merchants_params
    params.permit(:name, :created_at, :updated_at)
  end

end
