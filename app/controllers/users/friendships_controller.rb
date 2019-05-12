class Users::FriendshipsController < ApplicationController
  def create
    service = FriendshipService.new(current_user.github_id)
    status, response = service.add_friend(params[:friend_id])
    if status != 200
      flash[:error] = "Unable to befriend that user."
    end
    redirect_to dashboard_path
  end
end
