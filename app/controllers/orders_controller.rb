class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_order, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
     redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def move_to_top
    if current_user == @item.user || @item.buyer.present?
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
