class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(making_status:params[:order_detail][:making_status])
    if @order_detail.making_status == "producing"
      @order_detail.order.update(received: 2)
    elsif @order_detail.making_status == "preparing"
      @order_detail.order.update(received: 3)
    end
    redirect_to admin_path
  end
end
