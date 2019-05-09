require 'rails_helper'

describe 'User' do
  it 'user can click connect to github' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                provider: 'github',
                                credentials: {token: ENV["GITHUB_API_TOKEN_A"]}
                              })
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_link('Connect to Github')
    expect(page).to_not have_css('.github')
    expect(user.github_token).to eq(nil)

    click_link 'Connect to Github'

    expect(user.github_token).to_not eq(nil)
  end
end
