class CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def empty
  end

  def create
    @cart_item = Cart_Item.new(cart_item_params)
    @cart_item.save
    redirect_to cart_item_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:image, :name, :price, :amount)
  end
end
