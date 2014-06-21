class UsersController < ApplicationController
  def new
  	@title = "Sign In"

  end

  def show
  	@user = User.find(params[:id]) 
    
  end 

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:name, :email,:password,:password_confirmation)
  end
end
