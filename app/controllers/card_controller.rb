class CardController < ApplicationController
  before_action :set_card, only: [:new, :destroy, :show, :edit]
  
  require "payjp"

  def edit
    unless @card ==nil
      @user = @card.user_id
      Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    if @card
      redirect_to action: "show" 
    end  
  end

  def pay 
    Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to result_users_path
      else
        redirect_to action: "pay"
        
      end
    end
  end

  def destroy
    if @card.blank?
    else
      Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.destroy
    end
      redirect_to edit_card_path(current_user.id)
  end

  def show
    if @card.blank?

      redirect_to action: "new" 
    else
      
      Payjp.api_key = 'sk_test_6c130d285ae2b7dd291fc04f'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end