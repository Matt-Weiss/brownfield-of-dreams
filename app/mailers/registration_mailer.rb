class RegistrationMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail(to: user.email, subject: "Activate your account")
  end
end
