# frozen_string_literal: true

class FriendshipService
  def initialize(user)
    @id = user.github_id
  end

  def friends
    response = conn.get('/api/v1/friendships')
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def add_friend(recipiator)
    response = conn.post('/api/v1/friendships', {
      initiator: @id,
      recipiator: recipiator[:github_id]
    })
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  private

  def conn
    Faraday.new('https://exampleapp.herokuapp.com') do |f|
      f.headers['Authorization'] = ENV['FRIENDSHIP_API_KEY']
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end
end
