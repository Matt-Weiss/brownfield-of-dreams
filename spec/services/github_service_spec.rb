require 'rails_helper'

describe GithubService do
  context "instance methods" do
    before :each do
      response = File.new('./spec/data/user_b_repos.txt')
      stub_request(:get, 'https://api.github.com/user/repos').to_return(response)
      @user = User.create!(email: "User@example.com",
                      first_name: "Matt",
                       last_name: "Weiss",
                        password: "password",
                            role: 0,
                    github_token: ENV["GITHUB_API_TOKEN_B"]
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "gets repos" do
      service = GithubService.new(@user[:github_token])
      result = service.get_repos

      expect(result).to be_a(Array)
      expect(result[0]).to have_key(:name)
    end
  end
end
