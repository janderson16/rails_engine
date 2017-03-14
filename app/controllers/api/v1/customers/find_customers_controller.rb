class Api::V1::Customers::FindCustomersController < ApplicationController

  def show
    render json: Customer.find_by(params[:find_customer_params])
  end

  def index
    render json: Customer.where(params[:find_customers_params])
  end

  private

  def find_customers_params
    params.permit(:name, :created_at, :updated_at)
  end

end
