class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order("id desc")
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

  def edit
  end 

  def show
  end 

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def move_to_index
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id, :shipping_status_id, :image).merge(user_id: current_user.id)
  end
end
