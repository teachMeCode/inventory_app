class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @is_signup = true
  end

  def create
    @user = User.new(params.require(:user).permit(:nm_first, :nm_last, :email, :password, :password_confirmation))
    if @user.save
      redirect_to root_path
    else
      render 'new'  
    end
  end

  def show
  end

   def edit
    if current_user && current_user.id == User.find(params[:id]).id
      @user = User.find(params[:id])
    else
      redirect_to welcome_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    reset_session
    User.find(params[:id]).destroy
    redirect_to welcome_path
  end

end #this is the end
