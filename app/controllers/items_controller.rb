class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at:"desc").limit(10)
    @images = Image.all.order(created_at:"desc").limit(10)
  end

  def buy
    @buyer = Buyer.new
    @seller = Seller.new
    @item    = Item.find(params[:id])
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @buyer.save!
    @seller = Seller.new(seller_params)
    @seller.save!
    if @buyer.save && @seller.save
      redirect_to root_path
    else
      render :buy
    end
  end

  def show
    @items = Item.all.order(created_at:"desc").limit(6)
    @item = Item.find(params[:id])
    @sold = Buyer.find_by(item_id: @item.id)

  end

  def sell
    @item = Item.new
    @item.images.build
  end

  def create
    @item  = Item.new(item_params)

    if @item.save
      params[:images][:image].each do |image|
        @item.images.create!(images: image, item_id: @item.id)
      end
      redirect_to sell_items_path
    else
      redirect_to sell_items_path
    end
  end


  # source ~/.zshrc
  def item_params
    params.require(:item).permit(:name, :description, :price,  :burden, :area, :days)
  end
  private

    def buyer_params
      params.require(:buyer).permit(:user_id, :item_id)
    end

    def seller_params
      params.require(:seller).permit(:user_id, :item_id)
    end
end
