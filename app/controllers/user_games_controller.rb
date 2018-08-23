class UserGamesController < ApplicationController

  def index
    @user_games = UserGame.all
  end

  def show
    @user_game = UserGame.find(params[:id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = "guest"
    end
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
    # binding.pry
    @this_user = User.find(session[:user_id])
    @user_game = UserGame.find(params[:id])
  end

  def destroy
    @user_game = UserGame.find(params[:id])
    @user_game.destroy
      redirect_to user_path(session[:user_id])
  end

  def purchase
    transaction
    redirect_to user_path(session[:user_id])
  end

  private

    def ok_params
      params.require(:user_game).permit!
    end

    def transaction
      buyer = User.find(session[:user_id])
      seller = User.find(UserGame.find(params[:id]).user_id)
      @user_game = UserGame.find(params[:id])
      @user_game.status = 'Sold'
      @user_game.user_id = buyer.id
      buyer.balance = buyer.balance - @user_game.list_price
      seller.balance = seller.balance + @user_game.list_price
      buyer.save
      seller.save
      @user_game.save
    end

end
