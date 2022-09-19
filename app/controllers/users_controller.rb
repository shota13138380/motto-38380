class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: @user.id)

    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_list = Item.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
