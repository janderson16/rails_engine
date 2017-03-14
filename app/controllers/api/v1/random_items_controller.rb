class Api::V1::RandomItemsController < ApplicationController

  def show
    @item = Item.all.shuffle.pop
  end

end