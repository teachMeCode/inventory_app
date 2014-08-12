class ItemsController < ApplicationController

  def index
    if current_user
      @items = current_user.items.all
    else
      redirect_to new_session_path
    end
  end

  #  def index
  #   if current_user == Item.find(params[:id]).user
  #     @items = current_user.items.all
  #   else
  #     redirect_to new_session_path
  #   end
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:Item).permit(:title, :medium, :theme, :size, :status, :location, :dt_finished))
    if @item.save
      redirect_to items_path
    else
      render 'new'  
    end
  end

  def show
  end

   def edit
    if current_user && current_user.id == Item.find(params[:id]).id
      @item = Item.find(params[:id])
    else
      redirect_to welcome_path
    end
  end

  def update
  end

  def destroy
  end
  
end #this is the end
