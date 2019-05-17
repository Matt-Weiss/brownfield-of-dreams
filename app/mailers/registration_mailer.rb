class RegistrationMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(to: user.email, subject: "Activate your account")
  end

  def invite(inviter, invitee)
    @invitee = invitee
    @inviter = inviter
    mail(to: @invitee[:email], subject: "Invitation to Join Turing Tutorials")
  end
end
