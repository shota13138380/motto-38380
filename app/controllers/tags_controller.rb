class TagsController < ApplicationController
  def index
    
  end

  def show
    @tag = Tag.find(params[:id])
    @items = @tag.items
  end
end
