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
    @item = Item.new
    @item.images.build
  end

  def create
    @item  = Item.new(item_params)

    if @item.save
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
      redirect_to sell_items_path
    else
      redirect_to sell_items_path
    end
  end


  # source ~/.zshrc
  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
end
