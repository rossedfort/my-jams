class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = "This Account Doesn't Match Our Records"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:message] = "Goodbye"
    redirect_to login_path
  end
end
