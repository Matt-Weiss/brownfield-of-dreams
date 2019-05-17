class InvitesController < ApplicationController
  def new
  end

  def create
    invite = Invite.new(params[:login], current_user)
    if invite.send
      flash[:message] = "Successfully sent invite!"
    else
      flash[:error] = "The Github user you selected doesn't have an email address associated with their account."
    end
    redirect_to dashboard_path
  end

end
