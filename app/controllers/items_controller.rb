class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def buy
  end

  def show
  end

end
