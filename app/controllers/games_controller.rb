class GamesController < ApplicationController

  def index
    @games = game.all
  end

  def show
    get_game
  end

  private

  def get_game
    @game = Game.find(params[:id])
  end

end
