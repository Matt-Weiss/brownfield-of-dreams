require 'rails_helper'

describe GithubRepo do
  it "has attributes" do
    attributes = {
          name: "Test Repo",
          html_url: "https://test_link.com"
          }

    test_repo = GithubRepo.new(attributes)

    expect(test_repo.name).to eq('Test Repo')
    expect(test_repo.url).to eq('https://test_link.com')
  end
end
