class UsersController < ApplicationController


  def index
    @items = Buyer.where(params[:id]).limit(3)
  end

  def new
  end

  def show

  end

  def new

  end

  def edit
    @id = current_user.id

  end

  def destroy

  end

  def result

  end


  def todo

  end

  def past

  end






end
