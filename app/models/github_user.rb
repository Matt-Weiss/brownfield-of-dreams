# frozen_string_literal: true

class GithubUser
  attr_reader :handle,
              :profile_url,
              :github_id,
              :local_user

  def initialize(user_hash, local_user)
    @handle = user_hash[:login]
    @profile_url = user_hash[:html_url]
    @github_id = user_hash[:id]
    @local_user = local_user
  end
end
