class GithubRepo
  attr_reader :name,
              :url

  def initialize(repo_hash)
    @name = repo_hash[:name]
    @url = repo_hash[:html_url]
  end
end
