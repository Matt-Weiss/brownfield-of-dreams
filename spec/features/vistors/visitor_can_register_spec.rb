# frozen_string_literal: true

require 'rails_helper'

describe 'vister can create an account', :js do
  it ' visits the home page' do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(email)
    expect(page).to have_content("Logged in as #{first_name} #{last_name}")
    expect(page).to have_content("This account has not yet been activated. Please check your email.")
    expect(page).to_not have_content('Sign In')
  end

  it 'recieves email activation link after registering' do
    email = 'jimbob@aol.com'
    first_name = 'Jim'
    last_name = 'Bob'
    password = 'password'
    password_confirmation = 'password'

    visit new_user_path

    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on'Create Account'

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    email = ActionMailer::Base.deliveries.last

    expect(email.subject).to eq("Activate your account")
    expect(email.body).to have_content("Visit here to activate your account.")

    # simulate clicking on activation link, since we can't load the email in a
    # full Capybara session
    body = Capybara.string(email.body)
    visit body.find('a#activate').href

    expect(page).to have_content("Thank you! Your account is now activated.")

    visit dashboard_path

    expect(page).to have_content("Status: Active")
  end
end
