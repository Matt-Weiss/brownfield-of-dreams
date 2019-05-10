# frozen_string_literal: true

class GithubUser
  attr_reader :handle,
              :profile_url,
              :github_id

  def initialize(user_hash)
    @handle = user_hash[:login]
    @profile_url = user_hash[:html_url]
    @github_id = user_hash[:id]
  end

  def is_local_user?
    true # haven't yet decided how to do this DB call
  end
end
