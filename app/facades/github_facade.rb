# frozen_string_literal: true

class GithubFacade
  def initialize(user)
    @token = user[:github_token]
  end

  def repos(limit = 5)
    api_data(:repos)[0..(limit - 1)].map do |repo|
      GithubRepo.new(repo)
    end
  end

  def followers
    api_data(:followers).map do |follower|
      local_user = local_users(:followers)
                   .detect{|u| u.github_id == follower[:id]}
      GithubUser.new(follower, local_user)
    end
  end

  def following
    api_data(:following).map do |user|
      local_user = local_users(:following)
                   .detect{|u| u.github_id == user[:id]}
      GithubUser.new(user, local_user)
    end
  end

  private

  def local_users(endpoint)
    case endpoint
    when :followers
      @_follower_users ||= User.where(github_id: api_data(endpoint)
                                                 .map{|user| user[:id]})
    when :following
      @_following_users ||= User.where(github_id: api_data(endpoint)
                                                  .map{|user| user[:id]})
    end
  end

  def api_data(endpoint)
    case endpoint
    when :repos
      @_repo_data ||= service.repos
    when :followers
      @_follower_data ||= service.followers
    when :following
      @_following_data ||= service.following
    end
  end

  def service
    @_service ||= GithubService.new(@token)
  end
end
