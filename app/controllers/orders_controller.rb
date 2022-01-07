class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @address = current_customer.address.id
    @order = Order.new
  end

  def confirmation
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

end
