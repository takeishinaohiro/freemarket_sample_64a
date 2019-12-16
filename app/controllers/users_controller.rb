class UsersController < ApplicationController
  # attr_accesso :
  # attr_accesso
  # attr_accesso


  def index
    @user = User.new  #form forのため@contentの中身を無くす
  end


  def create
    @user = User.create(user_params) #privateのparamsに飛ばす
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
      params.require(:user).permit(:name, :email, :encrypted_password, :nickname, :katakana, :birthday)
    end

  
end


# モデルにattr_accessorを使用
# アクションに定義
