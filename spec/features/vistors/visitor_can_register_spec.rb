# frozen_string_literal: true

require 'rails_helper'

describe 'visitor can create an account', :js do
  before :each do
    ActionMailer::Base.deliveries = []
  end

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

    user = User.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    email = ActionMailer::Base.deliveries.last

    expect(email.subject).to eq("Activate your account")
    expect(email.body.parts[1].body).to have_content("Visit here to activate your account.")

    # simulate clicking on activation link, since we can't load the email in a
    # full Capybara session
    email_body = Capybara.string(email.body.parts[1].body.to_s)
    expect(email_body.find('a#activate')[:href]).to have_content(user_activation_path(user))
    visit user_activation_path(user)

    expect(page).to have_content("Thank you! Your account is now activated.")

    visit dashboard_path

    expect(page).to have_content("Status: Active")
    expect(page).to_not have_content("This account has not yet been activated. Please check your email.")
  end

  it 'shows error if email is already is use' do
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
    click_on 'Create Account'
    expect(current_path).to eq(dashboard_path)
    click_on 'Log Out'
    expect(current_path).to eq(root_path)

    visit new_user_path
    fill_in 'user[email]', with: email
    fill_in 'user[first_name]', with: 'Joe'
    fill_in 'user[last_name]', with: 'Bob'
    fill_in 'user[password]', with: 'password2'
    fill_in 'user[password_confirmation]', with: 'password2'
    click_on 'Create Account'
    expect(page).to have_content("Username already exists")
    expect(current_path).to eq(users_path)

  end
end
