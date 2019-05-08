require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should see a section for "Github"' do
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
      it 'I see a list of 5 repositories' do
        visit dashboard_path

        expect(page).to have_css(".github")
        within ".github" do
          expect(page).to have_content("Github")
          expect(page).to have_selector("li", minimum: 1, maximum: 5)
        end
      end

      it 'Shows the correct repo list' do
        visit dashboard_path

        within ".github" do
          expect(page).to have_content("additional_prework")
          expect(page).to_not have_content("authentication-exploration")
        end
      end

      it 'the name of each Repo is a link to the repo on github' do
        visit dashboard_path

        within ".github" do
          expect(page).to have_link("additional_prework", href: "https://github.com/Matt-Weiss/additional_prework")
        end
      end
    end
  end
end
