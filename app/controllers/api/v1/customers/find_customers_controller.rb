class Api::V1::Customers::FindCustomersController < ApplicationController

  def show
    render json: Customer.find_by(find_customers_params)
  end

  def index
    render json: Customer.where(find_customers_params)
  end

  private

  def find_customers_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
