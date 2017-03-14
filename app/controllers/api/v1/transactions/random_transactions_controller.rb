class Api::V1::Transactions::RandomTransactionsController < ApplicationController

  def show
    @transaction = Transaction.all.shuffle.pop
  end

end
