class GithubFacade

  def initialize(user)
    @token = user[:github_token]
  end

  def repos(limit = 5)
    api_data(:repos)[0..(limit-1)].map do |repo|
      GithubRepo.new(repo)
    end
  end

  def followers
    api_data(:followers).map do |follower|
      GithubUser.new(follower)
    end
  end

  def following
    api_data(:following).map do |user|
      GithubUser.new(user)
    end
  end

  private

  def api_data(endpoint)
    case endpoint
    when :repos
      @_repo_data ||= service.get_repos
    when :followers
      @_follower_data ||= service.get_followers
    when :following
      @_following_data ||= service.get_following
    end
  end

  def service
    @_service ||= GithubService.new(@token)
  end
end
