class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order.update(received:params[:order][:received])
    if @order.received == "confirmation"
      @order.order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method, :billing)
  end
end
