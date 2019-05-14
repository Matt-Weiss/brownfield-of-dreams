# frozen_string_literal: true

class Users::FriendshipsController < ApplicationController
  def create
    if User.find_by(github_id: params[:friend_id])
      service = FriendshipService.new(current_user.github_id)
      @result = service.add_friend(params[:friend_id])
    end
    flash[:error] = 'Unable to befriend that user.' unless @result == 200
    redirect_to dashboard_path
  end
end
