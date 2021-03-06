class ItemsController < ApplicationController

  before_action :find_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "投稿されました"
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :content, images:[]).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
