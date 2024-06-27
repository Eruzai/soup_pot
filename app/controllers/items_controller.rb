class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.find (current_user.id)
    @items = @user.items.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find (current_user.id)
    @item = @user.items.new(item_params)

    if @item.save
      redirect_to '/items', notice: 'CREATED'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to '/items', notice: 'EDITED'
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'DELETED!!!'
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :expiration_date)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
