class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    get_usr
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(usr_params)
    redirect_to user_path(@user)
  end

  def edit
    get_usr
  end

  def update
    @user = get_usr.update(usr_params)
    redirect_to user_path(@user)
  end

  def delete
    redirect_to users_path
  end

  private

    def get_usr
      @user = User.find(params[:id])
    end

    def usr_params
      params.require(:user).permit(:name, :balance)
    end

end
