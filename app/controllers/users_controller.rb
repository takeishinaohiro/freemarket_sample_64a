class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
    @id = current_user.id
  end

  def destroy
  end

end
