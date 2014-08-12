class SessionsController < ApplicationController

  def new
    @user = User.new
    @is_login = true
  end

  #------------------------------------------------------------------------------------------------
  # This controls the entire login process

  def create
    user = User.where(email: params[:user][:email]).first
    # Checks to see if the user exists, and then for a matching password
    if user && user.authenticate(params[:user][:password])
      # Creates a cookie for the user, holding the logged in user ID
      session[:user_id] = user.id.to_s
      redirect_to root_path # => if user exists, redirect to home page
    else
      redirect_to new_session_path  # => this is the default login page
    end
  end

  def destroy
    # Kill all of our cookies
    reset_session
    redirect_to new_session_path # build a welcome page
    # redirect_to root_path # build a welcome page
  end
end