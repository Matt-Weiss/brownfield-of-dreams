# frozen_string_literal: true

class Invite
  def initialize(login, current_user)
    service = GithubService.new(current_user.github_token)
    @inviter = service.user
    @invitee = service.user(login)
  end

  def send
    if @invitee[:email]
      RegistrationMailer.invite(@inviter, @invitee)
      true
    else
      false
    end
  end
end
