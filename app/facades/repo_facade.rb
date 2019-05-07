class RepoFacade

  def initialize(user)
    @token = user[:github_token]
  end

  def repos(limit = 5)
    repo_data[0..(limit-1)].map do |repo|
      GithubRepo.new(repo)
    end
  end

  private

  def repo_data
    @_repo_data ||= service.get_repos
  end

  def service
    @_service ||= GithubService.new(@token)
  end
end
