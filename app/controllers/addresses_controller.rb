class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = Addresse.all
    @addresse = Addresse.new
  end

  def edit
    @addresse = Addresse.find(params[:id])
  end

  def create
    @addresse = Addresse.new(addresse_params)
    @addresse.save
    redirect_to addresses_path
  end

  def update
    @addresse = Addresse.find(params[:id])
    @addresse.update(addresse_params)
    redirect_to addresses_path
  end

  def destroy
    @addresse = Addresse.find(params[:id])
    @addresse.destroy
    redirect_to addresses_path
  end

  private

  def addresse_params
    params.require(:addresse).permit(:postal_code, :address, :name)
  end
end
