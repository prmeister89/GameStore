class UserGamesController < ApplicationController

  def index
    @user_games = UserGame.all
  end

  def show
    @user_game = UserGame.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def new
    @user_game = UserGame.new
  end

  def create
    @user_game = UserGame.new(ok_params)
    @user = User.find(session[:user_id])
    @user_game.user_id = @user.id
    @user_game.save
    # binding.pry
    # @user_game(user_id: )
    redirect_to user_path(@user.id)
  end

  def edit
    @user_game = UserGame.find(params[:id])
  end

  def update
    @user_game = UserGame.find(params[:id])
    # binding.pry
    @user_game.update(ok_params)
    redirect_to user_path(@user_game.user)
  end

  def buy
    @user_game = UserGame.find(params[:id])
  end

  def purchase

  end

  private

    def ok_params
      params.require(:user_game).permit!
    end

end
