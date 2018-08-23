class UsersController < ApplicationController

  # def index
  #   @users = User.all
  # end

  def show
    get_user
  end

  def new
    @user = User.new
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def create
    @user = User.create(username: params[:user][:username], name: params[:user][:name], balance: 5)
    session[:user_id] = @user.id

    redirect_to (user_path(@user))
  end

  def edit
    get_user
  end

  def update
    @user = get_user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
    redirect_to users_path
  end

  private

    def get_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :name, :balance)
    end

end
