class UsersController < ApplicationController
  def new
  	@title = "Sign In"

  end

  def show
  	@user = User.find(params[:id]) 
    @title = @user.name
    
  end 

  #Substitute  functions to attr:accessor 
  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:name, :email,:password,:password_confirmation)
  end
  # block ends 
end
