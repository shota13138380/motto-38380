class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    tag_list = params[:item_form][:tag_name].split(',').uniq
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
    @tags = @item.tags.pluck(:id, :tag_name)              # pluck(カラム名)で指定したカラムの値を配列で取得
  end

  def edit
    @item = Item.find(params[:id])
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    tags = @item.tags.pluck(:tag_name)               # pluck(カラム名)で指定したカラムの値を配列で取得
    @item_form.tag_name = tags.join(',')             # join('文字')で要素を指定した文字で繋ぐ
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    @item_form = ItemForm.new(item_form_params)
    tag_list = params[:item_form][:tag_name].split(',').uniq
    if @item_form.valid?
      @item_form.update(item_form_params, @item, tag_list)
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
