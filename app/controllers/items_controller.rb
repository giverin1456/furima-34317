class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :move_to_index, only: [:edit]
  
  def index
    @items = Item.all.order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def items_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless Item.find(params[:id]).user.id == current_user.id
      redirect_to action: :index
    end
  end
end
