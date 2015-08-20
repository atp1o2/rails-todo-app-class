class SessionsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  # logging in
  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:username])
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:incorrect] = "Incorrect Login"
      render 'new'
    end
  end

  def destroy
    logout!
    redirect_to root_path
  end

  # private
  # def user_params
  #   params.require(:user).permit(:username, :password)
  # end

end
