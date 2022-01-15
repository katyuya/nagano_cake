class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method, :billing)
  end
end
