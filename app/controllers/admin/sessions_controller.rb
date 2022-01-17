class Admin::SessionsController < ApplicationController
  before_action :authenticate_admin!
  def new
  end

  def create
  end

  def destroy
  end
end
