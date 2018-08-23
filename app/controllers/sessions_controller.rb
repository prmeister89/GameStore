class SessionsController < ApplicationController

  def welcome
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      flash.notice = "No User with that name"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
