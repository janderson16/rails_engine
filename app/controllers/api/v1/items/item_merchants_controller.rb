class Api::V1::ItemMerchantsController < ApplicationController
  def index
    render json: Item.find(params[:id]).merchant
  end
end