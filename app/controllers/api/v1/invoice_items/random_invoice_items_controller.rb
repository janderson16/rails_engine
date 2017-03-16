class Api::V1::InvoiceItems::RandomInvoiceItemsController < ApplicationController

  def show
    @customer = Customer.all.shuffle.pop
  end

end