class ApplicationController < ActionController::Base
  helper_method :current_user
  # :most_recent_song
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # def most_recent_song
  #   Song.find(session[:most_recent_song_id])
  # end
end
