class WelcomeController < ApplicationController
  def show
    @songs = Song.all
    render :show
  end
end
