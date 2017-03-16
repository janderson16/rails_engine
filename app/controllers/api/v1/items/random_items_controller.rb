class Api::V1::Items::RandomItemsController < ApplicationController

  def show
    @item = Item.all.shuffle.pop
  end

end