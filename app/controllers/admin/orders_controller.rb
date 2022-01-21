class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])

  end

  def update
    @order = Order.find(params[:id])
    received_change_to_1 = @order.received_was == 0 and @order.received == 1
    @order.update(received:params[:order][:received])
    @order.order_details.update_all(making_status: 1)
    redirect_to admin_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method, :billing)
  end
end
