class ItemsController < ApplicationController

  def index
    if current_user
      @items = current_user.items.all
    else
      redirect_to new_session_path
    end
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(params.require(:items).permit(:title, :medium, :theme, :size, :status, :location, :dt_finished))
    if @Item.save
      redirect_to items_path
    else
      render 'new'  
    end
  end

  def show
    if current_user
      @items = current_user.items.all
    else
      redirect_to new_session_path
    end
  end

   def edit
    if current_user && current_user.id == Item.find(params[:id]).id
      @items_path = Item.find(params[:id])
    else
      redirect_to welcome_path
    end
  end

  def update
  end

  def destroy
  end
  
end #this is the end
