class Api::V1::Customers::RandomCustomersController < ApplicationController

  def show
    @customer = Customer.all.shuffle.pop
  end

end
