class Admin::HomesController < ApplicationController
  def top
    @order_details = OrderDetail.page(params[:page]).order("created_at")
  end
end
