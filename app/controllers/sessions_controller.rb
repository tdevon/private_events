class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = "Invalid ID"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to '/login'
  end
end
