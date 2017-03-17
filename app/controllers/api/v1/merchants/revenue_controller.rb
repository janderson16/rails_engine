class Api::V1::Merchants::RevenueController < ApplicationController

  def show
   render json: {"revenue" =>  ((Merchant.find(params[:id]).revenue.to_f) / 100).to_s}
  end

end
