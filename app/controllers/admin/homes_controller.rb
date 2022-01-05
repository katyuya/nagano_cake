class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).order("create_at")
  end
end
