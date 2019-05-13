require 'rails_helper'

describe GithubUser do
  it "has attributes" do
    attributes = {
          login: "Test User",
          html_url: "https://test_link.com"
          }

    test_user = GithubUser.new(attributes, nil)

    expect(test_user.handle).to eq('Test User')
    expect(test_user.profile_url).to eq('https://test_link.com')
  end
end
