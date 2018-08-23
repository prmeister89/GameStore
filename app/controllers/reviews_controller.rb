class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @game = Game.find(params[:id])
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = "guest"
    end
  end

  def create
    # binding.pry
    @review = Review.create(ok_params)
    @user =  User.find(session[:user_id])
    @review.user_id = @user.id
    @review.game_id = params[:id]
    @review.save
    redirect_to game_path(Game.find(params[:id]))
  end

  private

  def ok_params
    params.require(:review).permit!
  end

end
