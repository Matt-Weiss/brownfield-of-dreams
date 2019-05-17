# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    render locals: {
      github_facade: GithubFacade.new(current_user),
      friends_facade: FriendshipFacade.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      perform_login(user)
      redirect_to dashboard_path
    else
      flash.now[:message] = 'Username already exists'
      @user = user
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    current_user.update_attribute(:active, true) if user == current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

  def perform_login(user)
    RegistrationMailer.confirm(user).deliver_now
    session[:user_id] = user.id
    flash[:message] = "Logged in as #{user.first_name} #{user.last_name}"
  end
end
