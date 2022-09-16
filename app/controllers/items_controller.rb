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
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    tag_list = params[:item_form][:tag_name].split(',')
    if @item_form.valid?
      @item_form.save(tag_list)
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
    @item_tags = @item.item_tags.includes(:item)
    @tags = []
    @item_tags.each do |item_tags|
      @tags << Tag.find(item_tags.tag_id)
    end
  end

  def edit
    @item = Item.find(params[:id])
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    tag_names = []
    @item.tags.each do |tag|
      tag_names << tag.tag_name
    end
    @item_form.tag_name = tag_names.join(',')
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.update(item_form_params, @item)
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

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def item_form_params
    params.require(:item_form).permit(:name, :content, :privacy_id, :tag_name, :image).merge(user_id: current_user.id)
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
