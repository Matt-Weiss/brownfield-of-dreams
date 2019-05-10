require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should see a section for "Followers"' do
      before :each do
        response = File.new('./spec/data/user_a_followers.txt')
        stub_request(:get, 'https://api.github.com/user/followers').to_return(response)

        @user = User.create!(email: "User@example.com",
                        first_name: "Jon",
                         last_name: "Peterson",
                          password: "password",
                              role: 0,
                      github_token: ENV["GITHUB_API_TOKEN_A"]
                            )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end
      it 'I see a button to add followers if they have an account here' do
        visit dashboard_path

        within ".followers" do
          expect(page).to have_css("a[href='/add_friend/45211960']")
        end
      end

      it 'Users I have added as a friend are displayed' do
        visit dashboard_path

        within ".friends" do
          expect(page).to_not have_content("Matt-Weiss")
        end

        click_link "Add as Friend"

        within ".friends" do
          expect(page).to have_content("Matt-Weiss")
        end
      end

      xit 'I cannot make a friend request with an invalid id' do
        visit add_friend_path('999999999')

        expect(current_path).to eq(dashboard_path)
        within ".errors" do
          expect(page).to have_content("Unable to befriend that user.")
        end
      end
    end
  end
end
