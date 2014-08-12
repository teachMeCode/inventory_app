class ItemsController < ApplicationController

  def index
    if current_user
      @item = current_user.items.all
    else
      redirect_to new_session_path
    end
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(params.require(:item).permit(:title, :medium, :theme, :size, :status, :location, :dt_finished))
    if @item.save
      redirect_to items_path
    else
      render 'new'  
    end
  end

  def show
    if current_user
      @item = current_user.items.all
    else
      redirect_to new_session_path
    end
  end

   def edit
    if current_user && current_user.id == Item.find(params[:id]).id
      @items_path = Item.find(params[:id])
    else
      redirect_to edit_item_path
    end
  end

  def update
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end
  
end #this is the end
