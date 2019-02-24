class LikesController < ApplicationController
  
  def create
    @like = Like.new(item_id: params[:item_id])
    @like.save
    redirect_to("/items/#{params[:item_id]}")
  end
  
  
  def destroy
    @like = Like.find_by(item_id: params[:item_id])
    @like.destroy
  end
  
  def index
    counts(@items)
  end
  
end