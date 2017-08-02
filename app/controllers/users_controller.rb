class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]= "User Created Succesfully!"
      redirect_to users_path
    else
      render :new
    end
  end
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= "User Updated Succesfully!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]= "User Deleted Succesfully!"
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:username)
  end
end
