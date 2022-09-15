class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = if user_signed_in?
               Item.where(user_id: current_user.id).or(Item.where(privacy_id: 2)).order('created_at DESC')
             else
               Item.where(privacy_id: 2).order('created_at DESC')
             end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    redirect_to root_path unless judge_privacy
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :privacy_id, :image).merge(user_id: current_user.id)
  end

  def judge_privacy
    if @item.privacy_id == 2
      true
    elsif user_signed_in? && current_user.id == @item.user_id
      true
    else
      false
    end
  end
end
