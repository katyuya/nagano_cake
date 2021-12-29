class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
