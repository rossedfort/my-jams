class WelcomeController < ApplicationController
  def show
    if current_user
      @songs = User.find(session[:user_id]).songs
      render :show
    else
      render :show
    end
  end
end
