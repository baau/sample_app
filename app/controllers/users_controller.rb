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

  def person_params
    params.require(:Users).permit(:name, :email)
  end
end
