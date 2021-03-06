# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @_new ||= User.new
  end

  def create
    if auth_hash
      handle_oauth
    else
      local_auth
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def local_auth
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if session[:return_path]
        redirect_to session[:return_path]
      else
        redirect_to dashboard_path
      end
    else
      flash[:error] = 'Looks like your email or password is invalid'
      render :new
    end
  end

  def handle_oauth
    current_user.link_github(auth_hash)
    redirect_to dashboard_path
  end
end
