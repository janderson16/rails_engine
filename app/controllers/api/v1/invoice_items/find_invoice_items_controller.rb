class Api::V1::InvoiceItems::FindInvoiceItemsController < ApplicationController

  before_action :convert_price

  def convert_price
    if params[:unit_price]
      price = params[:unit_price].split(".").join
      params[:unit_price] = price
    end
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)

  end

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end