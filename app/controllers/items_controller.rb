class ItemsController < ApplicationController

  def new
  end

  def index
    @items = Item.includes(:images).order(created_at:"desc")
  end

  def buy
    @card = Card.where(user_id: current_user.id).first
    unless @card ==nil
      @user = @card.user_id
      Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @buyer = Buyer.new
    @seller = Seller.new
    @items = Item.all
    @item = Item.find(params[:id])
    @images = Image.all
  end

  def buy_create
    @item = Item.find(params[:id])
    @buyer = Buyer.new(buyer_params)
    @buyer.save!
    @seller = Seller.new(seller_params)
    @seller.save!
    if @buyer.save && @seller.save

      @card = Card.where(user_id: current_user.id).first
      Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'
      Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy' #日本円
    )
    redirect_to root_path
    else
      render :buy
    end

  end

  def show
    @items = Item.all.order(created_at:"desc").limit(6)
    # @images = Image.all.order(created_at:"desc").limit(6)
    @item = Item.find(params[:id])
    @sold = Buyer.find_by(item_id: @item.id)
    @prefecture = Prefecture.find(@item.area)
  end

  def sell
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
    @item.images.build
  end

  def create
    @item  = Item.new(item_params)
    if @item.save
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      redirect_to sell_items_path
    end
  end


  # source ~/.zshrc
  def item_params
    params.require(:item).permit(:name, :description, :category, :status, :price, :burden, :area, :days)
  end
  private

    def buyer_params
      params.require(:buyer).permit(:user_id, :item_id)
    end

    def seller_params
      params.require(:seller).permit(:user_id, :item_id)
    end
end
