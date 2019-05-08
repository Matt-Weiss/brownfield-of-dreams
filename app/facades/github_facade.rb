class GithubFacade

  def initialize(user)
    @token = user[:github_token]
  end

  private


  def service
    @_service ||= GithubService.new(@token)
  end
end
