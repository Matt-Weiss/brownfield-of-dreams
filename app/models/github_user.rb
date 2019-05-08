class GithubUser
  attr_reader :handle,
              :profile_url

  def initialize(user_hash)
    @handle = user_hash[:login]
    @profile_url = user_hash[:html_url]
  end
end
