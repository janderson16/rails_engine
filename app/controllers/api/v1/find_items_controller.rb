class Api::V1::FindItemsController < ApplicationController

  def show
    render json: Item.find_by(params[:find_items_params])
  end

  def index
    render json: Item.where(params[:find_items_params])
  end

  private

  def find_items_params
    params.permit(:name, :created_at, :updated_at)
  end

end