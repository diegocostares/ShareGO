class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @reviews = Review.all
    @user =  User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      redirect_to '/home'
    else
      redirect_to('/403', status: 403)
    end
  end
end
