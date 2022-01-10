class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @address = current_customer.address
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    if params[:order][:address_name] == "0"
      @order.shipping_zip_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_name] == "1"
      @address = Addresse.find(params[:order][:address_id])
      @order.shipping_zip_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.delivery_name = @address.name
    elsif params[:order][:address_name] == "2"

    else
      redirect_to new_orders_path
    end
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
