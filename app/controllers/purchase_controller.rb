class PurchaseController < ApplicationController
  before_action :set_item, only: [:index, :pay]

  def index
    @card = Card.where(user_id: current_user.id).first

    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: @card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  private

  def set_item
    
  end

end
