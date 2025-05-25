class MenusController < ApplicationController
  before_action :set_menu, only: [:confirm, :edit, :update, :destroy]

  def index
    @menus = Menu.page(params[:page]).per(10)
  end

  def confirm
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :price, :image_url, :is_available_today)
  end

end
