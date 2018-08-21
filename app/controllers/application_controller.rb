class ApplicationController < ActionController::Base

  helper_method :current_username

  def current_username
    if @user
      @user.username
    else
      @user = User.find_by(id: session[:user_id])
    end
  end
end
