class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    set_item
  end

  def create
    set_item
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city, :house_number, :building, :telephone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
