class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :expiration_date)
  end

  def find_item
    @item = item.find_by(id: params[:id])
  end
end
