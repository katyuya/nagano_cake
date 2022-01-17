class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    @order.update(received:params[:order][:received])
    redirect_to admin_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method, :billing)
  end
end
