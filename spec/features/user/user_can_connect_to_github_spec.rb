require 'rails_helper'

describe 'User' do
  it 'user can click connect to github' do
    followers = File.new('./spec/data/user_b_followers.txt')
    stub_request(:get, 'https://api.github.com/user/followers').to_return(followers)

    following = File.new('./spec/data/user_b_following.txt')
    stub_request(:get, 'https://api.github.com/user/following').to_return(following)

    get_friendship = File.new('./spec/data/empty_friendships_list.txt')
    stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships/45211960').to_return(get_friendship)

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                provider: 'github',
                                credentials: {token: ENV["GITHUB_API_TOKEN_B"]}
                              })
    user = create(:user,
              github_id: 45211960
                )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_link('Connect to Github')
    expect(page).to_not have_css('.github')
    expect(user.github_token).to eq(nil)

    click_link 'Connect to Github'

    expect(user.github_token).to_not eq(nil)
  end
end
