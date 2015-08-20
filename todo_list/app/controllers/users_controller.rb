class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      login(@user)
      redirect_to root_path
    else
      flash[:password_mismatch] = "Passwords do not match"
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end

