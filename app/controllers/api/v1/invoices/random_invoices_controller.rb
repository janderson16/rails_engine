class Api::V1::Invoices::RandomInvoicesController < ApplicationController

  def show
    @invoice = Invoice.all.shuffle.pop
  end

end