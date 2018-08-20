class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    get_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
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
      params.require(:user).permit(:name, :balance)
    end

end
