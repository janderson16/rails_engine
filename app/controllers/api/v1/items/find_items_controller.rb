class Api::V1::Items::FindItemsController < ApplicationController
  before_action :convert_price

  def convert_price
    if params[:unit_price]
      price = params[:unit_price].split(".").join
      params[:unit_price] = price
    end
  end

  def show
    render json: Item.find_by(find_items_params)
  end

  def index
    render json: Item.where(find_items_params)
  end

  private

  def find_items_params
    params.permit(:id, :name, :unit_price, :description, :created_at, :updated_at, :merchant_id)
  end

end
