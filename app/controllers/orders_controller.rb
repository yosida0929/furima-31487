class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
     redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :buyer_id, :item_id).merge(user_id: current_user.id)
  end
  
end
