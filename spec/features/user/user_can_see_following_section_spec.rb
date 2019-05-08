require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should see a section for "Following"' do
      before :each do
        response = File.new('./spec/data/user_a_following.txt')
        stub_request(:get, 'https://api.github.com/user/following').to_return(response)

        @user = User.create!(email: "User@example.com",
                        first_name: "Jon",
                         last_name: "Peterson",
                          password: "password",
                              role: 0,
                      github_token: ENV["GITHUB_API_TOKEN_A"]
                            )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end
      it 'I see a list of the users the current user is following' do
        visit dashboard_path

        expect(page).to have_css(".following")
        within ".following" do
          expect(page).to have_content("Following")
          expect(page).to have_selector("li", count: 6)
        end
      end

      it 'Shows the correct list of followed users' do
        visit dashboard_path

        within ".following" do
          expect(page).to have_content("Matt-Weiss")
          expect(page).to_not have_content("joequincy")
        end
      end

      it 'the handle of each followed user is a link to their profile on github' do
        visit dashboard_path

        within ".following" do
          expect(page).to have_link("Matt-Weiss", href: "https://github.com/Matt-Weiss")
        end
      end
    end
  end
end
