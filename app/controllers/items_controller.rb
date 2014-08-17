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
      flash[:success] = "New item has been added"
    else
      render 'new'  
    end
  end

  def show
    if current_user
      @item = current_user.items.all
      # @item = Item.find(params[:id])
    else
      redirect_to items_path
    end
  end

   def edit
    if current_user && current_user == Item.find(params[:id]).user #use user because this refers to the _id in the User document db (mongo)
      @item = Item.find(params[:id])
      flash[:success] = "Items have been updated"
      #flash[:alert] = "Alerting you to the monkey on your car!"
    else
      redirect_to items_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params.require(:item).permit(:title, :medium, :theme, :size, :status, :location, :dt_finished))
      redirect_to items_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
    flash[:notice] = "Item has been deleted"
  end
  
end #this is the end
