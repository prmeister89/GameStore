class UserGamesController < ApplicationController


  def new
    @user_game = UserGame.new
    @user = User.find(params[:id])
  end

  def create
    @user_game = UserGame.create(ok_params)
    # redirect_to user_path(@user_game.user)
  end

  def edit
    @user_game = UserGame.find(params[:id])
  end

  def update
    @user_game.update(ok_params)
    # redirect_to user_path(@user_game.user)
  end

  private

    def ok_params
      params.require(:user_game).permit!
    end

end
