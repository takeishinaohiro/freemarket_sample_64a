class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def buy
    @buyer = Buyer.new
    @seller = Seller.new
    @items = Item.all
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
    @items = Item.all
    @item = Item.find(params[:id])
    @sold = Buyer.find_by(item_id: @item.id)

  end

  def sell
  end
  # source ~/.zshrc
  private

    def buyer_params
      params.require(:buyer).permit(:user_id, :item_id)
    end

    def seller_params
      params.require(:seller).permit(:user_id, :item_id)
    end
end
