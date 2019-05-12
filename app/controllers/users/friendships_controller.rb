class Users::FriendshipsController < ApplicationController
  def create
    service = FriendshipService.new(current_user.github_id)
    service.add_friend(params[:friend_id])
  end
end
