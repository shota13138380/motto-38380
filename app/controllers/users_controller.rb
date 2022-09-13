class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: @user.id)
  end

end
