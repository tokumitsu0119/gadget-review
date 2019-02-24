class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  
  def index
    @items = Item.all.page(params[:page])
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = 'レビューが正常に投稿されました'
      redirect_to @item
    else
      flash.now[:danger] = 'レビューが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = 'レビューは正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = 'レビューは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @item.destroy

    flash[:success] = 'レビューは正常に削除されました'
    redirect_to items_url
  end
  
  def like
    # favoriteカラムを
    @item = Item.find(params[:id])
    redirect_to root_url
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  # Strong Parameter
  def item_params
    params.require(:item).permit(:item, :content)
  end
end
