class Api::V1::Items::FindItemsController < ApplicationController

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
