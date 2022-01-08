class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @address = current_customer.address
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirmation_path

  end

  def thanks
  end

  def create

  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method)
  end
end
