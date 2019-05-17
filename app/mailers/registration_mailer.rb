class RegistrationMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(to: user.email, subject: "Activate your account")
  end

  def invite(email_address, invitee_name, inviter_name)
    @invitee_name = invitee_name
    @inviter_name = inviter_name
    mail(to: email_address, subject: "Invitation to Join Turing Tutorials")
  end
end
