# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if params[:tag]
      @tutorials = tagged_tutorials
    else
      @tutorials = untagged_tutorials
    end
  end

  private

  def tagged_tutorials
    Tutorial.limit_to_users(current_user)
            .tagged_with(params[:tag])
            .paginate(page: params[:page], per_page: 5)
  end

  def untagged_tutorials
    Tutorial.limit_to_users(current_user)
            .all
            .paginate(page: params[:page], per_page: 5)
  end
end
