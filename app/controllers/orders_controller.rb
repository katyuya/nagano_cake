class OrdersController < ApplicationController
  def new
    @customer = current_customer
    @address = current_customer.address
    @order = Order.new
  end

  def confirmation
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @total_price = (@total + 800)
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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price_time = cart_item.item.price
        order_detail.save
      end
      redirect_to orders_thanks_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer.orders

  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_zip_code, :shipping_address, :delivery_name, :payment_method, :billing)
  end
end
