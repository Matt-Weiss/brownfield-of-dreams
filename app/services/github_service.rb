# frozen_string_literal: true

class GithubService
  def initialize(token)
    @token = token
  end

  def repos
    get_json('user/repos')
  end

  def user(username = nil)
    if username
      get_json("users/#{username}")
    else
      get_json('user')
    end
  end

  def followers
    get_json('user/followers')
  end

  def following
    get_json('user/following')
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.github.com/') do |f|
      f.headers['Authorization'] = "token #{@token}"
      f.adapter Faraday.default_adapter
    end
  end
end
