class InvitesController < ApplicationController
  def new
  end

  def create
    invite = Invite.new(params[:login], current_user)
    redirect_to dashboard_path
  end

end
