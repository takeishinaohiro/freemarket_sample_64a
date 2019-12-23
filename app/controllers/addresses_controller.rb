class AddressesController < ApplicationController
 
  def new
    @address = Address.new
  end
  
  def create
    @address = Address.create(address_params)
    if @address.save
      redirect_to new_card_path
    else
      render :new
    end
    
  end

  private 
    def address_params
      params.require(:address).permit(:name,:name2,:katakana,:katakana2, :postal_code, :prefucture, :city, :city_address, :building, :phone_number, :user_id)
    end
end
