class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at:"desc").limit(10)
    @images = Image.all.order(created_at:"desc").limit(10)
  end

  def buy
    @buyer = Buyer.new
    @seller = Seller.new
    @items = Item.all
    @item = Item.find(params[:id])
    @images = Image.all
    @image = Image.find(params[:id])
  end

  def buy_create
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])
    @buyer = Buyer.new(buyer_params)
    @buyer.save!
    @seller = Seller.new(seller_params)
    @seller.save!
    if @buyer.save && @seller.save
      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy' #日本円
    )
    redirect_to done_purchase_index_path
    else
      render :buy
    end

  end

  def show
    @items = Item.all.order(created_at:"desc").limit(6)
    @images = Image.all.order(created_at:"desc").limit(6)
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])
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
      redirect_to root_path
    else
      redirect_to sell_items_path
    end
    binding.pry
  end


  # source ~/.zshrc
  def item_params
    params.require(:item).permit(:name, :description, :price, :burden, :area, :days)
  end
  private

    def buyer_params
      params.require(:buyer).permit(:user_id, :item_id)
    end

    def seller_params
      params.require(:seller).permit(:user_id, :item_id)
    end
end
