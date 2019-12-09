class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def buy
    @items = Item.all
    @id    = Item.find(params[:id])
  end
  def show
    @items = Item.all
    @id    = Item.find(params[:id])
  end

  def sell
  end
  source ~/.zshrc
end
