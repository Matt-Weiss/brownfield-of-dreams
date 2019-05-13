class Users::FriendshipsController < ApplicationController
  def create
    if User.find_by(github_id: params[:friend_id])
      service = FriendshipService.new(current_user.github_id)
      status, response = service.add_friend(params[:friend_id])
      if status != 200
        flash[:error] = "Unable to befriend that user."
      end
    else
      flash[:error] = "Unable to befriend that user."
    end
    redirect_to dashboard_path
  end
end
