class Api::V1::FindMerchantsController < ApplicationController
  def show
    render json: merchant.find_by(params[:find_merchants_params])
  end
  def index
    render json: merchant.where(params[:find_merchants_params])
  end
  private
  def find_merchants_params
    params.permit(:name, :created_at, :updated_at)
  end
end