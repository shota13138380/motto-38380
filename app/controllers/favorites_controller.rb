class FavoritesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id) if @item.user_id != current_user.id
    redirect_to item_path(@item.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    @favorite.destroy
    redirect_to item_path(@item.id)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
