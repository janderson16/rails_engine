class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController

  def show
    render json: Merchant.find(params[:id]).customers_with_pending_invoices
  end

end
