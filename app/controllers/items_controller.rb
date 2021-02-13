class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
    # @item_images = ItemImage.all.order("id desc")
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

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id, :shipping_status_id, :image).merge(user_id: current_user.id)
  end
end
