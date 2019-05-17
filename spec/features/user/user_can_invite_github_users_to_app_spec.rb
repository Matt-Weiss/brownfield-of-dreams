require 'rails_helper'

describe 'As a registered user' do
  before :each do
    followers = File.new('./spec/data/user_b_followers.txt')
    stub_request(:get, 'https://api.github.com/user/followers').to_return(followers)

    following = File.new('./spec/data/user_b_following.txt')
    stub_request(:get, 'https://api.github.com/user/following').to_return(following)

    get_friendship = File.new('./spec/data/empty_friendships_list.txt')
    stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships/45211960').to_return(get_friendship)

    @user = create(:user,
            github_token: ENV["GITHUB_API_TOKEN_B"],
               github_id: 45211960
                  )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it 'should allow us to send an invite to a github user' do
    github_user = File.new('./spec/data/github_user.txt')
    stub_request(:get, 'https://api.github.com/users/octocat').to_return(github_user)

    visit '/dashboard'
    click_on "Send an Invite"
    expect(current_path).to eq(new_invite_path)

    fill_in "login", with: "octocat"
    click_on "Send Invite"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Successfully sent invite!") #(if the user has an email address associated with their github account)
  end

  it 'should tell us if our invited user does not have an email' do
    github_no_email = File.new('./spec/data/github_no_email.txt')
    stub_request(:get, 'https://api.github.com/users/octocat').to_return(github_no_email)

    visit '/dashboard'
    click_on "Send an Invite"
    expect(current_path).to eq(new_invite_path)

    fill_in "login", with: "octocat"
    click_on "Send Invite"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.") #if the user does not have an email address associated with their github account
  end
end
