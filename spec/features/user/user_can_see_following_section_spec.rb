require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should see a section for "Following"' do
      before :each do
        followers = File.new('./spec/data/user_a_followers.txt')
        stub_request(:get, 'https://api.github.com/user/followers').to_return(followers)

        following = File.new('./spec/data/user_a_following.txt')
        stub_request(:get, 'https://api.github.com/user/following').to_return(following)

        get_friendship = File.new('./spec/data/empty_friendships_list.txt')
        stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships/45211960').to_return(get_friendship)

        @user = create(:user,
                github_token: ENV["GITHUB_API_TOKEN_A"],
                   github_id: 3322920
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
