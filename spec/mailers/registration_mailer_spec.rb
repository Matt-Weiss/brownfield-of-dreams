require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  it "sends an activation email for the user" do
    user = create(:user)
    email = RegistrationMailer.confirm(user)

    expect(email.subject).to eq('Activate your account')
    expect(email.to.first).to eq(user.email)
    expect(email.from.first).to eq('noreply@serene-gorge-80745.herokuapp.com')
    expect(email.body.encoded).to match("/users/#{user.id}/activate")
  end

  it "sends an invite email to another user" do
    inviter = {login: "inviter"}
    invitee = {login: "invitee", email: "test@test.com"}
    email = RegistrationMailer.invite(inviter, invitee)

    expect(email.subject).to eq('Invitation to Join Turing Tutorials')
    expect(email.to.first).to eq(invitee[:email])
    expect(email.from.first).to eq('noreply@serene-gorge-80745.herokuapp.com')
    expect(email.body.encoded).to match("/register")
  end
end
