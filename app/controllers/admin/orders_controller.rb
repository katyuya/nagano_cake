class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @total_amount = order.order_details.inject(0) { |sum, order_detail| sum + order_detail.amount }
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end
end
