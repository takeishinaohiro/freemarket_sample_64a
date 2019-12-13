class UsersController < ApplicationController


  def index
    @user = User.new  #form forのため@contentの中身を無くす
  end

  def create
    @user = User.create(content_params) #privateのparamsに飛ばす

  end


  def show
  end

  def edit
    @id = current_user.id

  end

  def destroy
  end


  def todo

  end

  def past
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :encrypted_password, :nickname, :k_name, :birthday, :add_name, 
                                    :add_k_name, :postal_code, :city, :city_address, :building, :phone_number)
    end

  
end
