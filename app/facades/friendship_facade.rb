# frozen_string_literal: true

class FriendshipFacade
  def initialize(user)
    @id = user[:github_id]
  end

  def friends
    @_friends ||= User.where(github_id: api_data.map do |friend|
                                          friend[:attributes][:recipient]
                                        end)
  end

  private

  def api_data
    @_api_data ||= service.friends
  end

  def service
    @_service ||= FriendshipService.new(@id)
  end
end
