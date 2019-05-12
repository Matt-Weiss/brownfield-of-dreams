# frozen_string_literal: true

class FriendshipService
  def initialize(id)
    @id = id
  end

  def friends
    response = conn.get("/api/v1/friendships/#{@id}")
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def add_friend(recipient_id)
    response = conn.post('/api/v1/friendships', {
      initiator: @id,
      recipient: recipient_id
    })
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  private

  def conn
    Faraday.new('https://young-mountain-25786.herokuapp.com') do |f|
      f.headers['Authorization'] = ENV['FRIENDSHIP_API_KEY']
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end
end
