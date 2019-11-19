class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @events = current_user.events
    @upcoming_events = Event.where("start_date < ?", Time.now.beginning_of_day)
    @prev_events = Event.where("start_date > ?", Time.now.beginning_of_day)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
