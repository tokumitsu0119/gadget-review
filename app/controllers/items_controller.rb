class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:success] = 'レビューは正常に更新されました'
      redirect_to @item
    else
      flash.now[:danger] = 'レビューは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    flash[:success] = 'レビューは正常に削除されました'
    redirect_to items_url
  end
  
  # Strong Parameter
  def item_params
    params.require(:item).permit(:item)
  end
end
