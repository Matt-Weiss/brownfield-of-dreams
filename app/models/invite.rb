class Invite

  def initialize(login, current_user)
    service ||= GithubService.new(current_user.github_token)
    user_github_name = service.name
    invited_user = service.fetch_invited_user_email(login)
    email = invited_user[:email]
    invited_username = invited_user[:login]

    if email
      RegistrationMailer.invite(email, invited_username, user_github_name)
    else
      #shit don't work
    end
  end
end
