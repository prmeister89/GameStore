class GamesController < ApplicationController

  def index
    @games = Game.all
    if params[:search]
      @games = Game.search(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def show
    get_game
  end

  def review

  end

  private

  def get_game
    @game = Game.find(params[:id])
  end

end
