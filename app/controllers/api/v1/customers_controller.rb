class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find_by(params[:customer_id])
  end
end
