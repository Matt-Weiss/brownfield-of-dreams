require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should see a section for "Followers"' do
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
      it 'I see a list of the user\'s followers' do
        visit dashboard_path

        expect(page).to have_css(".followers")
        within ".followers" do
          expect(page).to have_content("Followers")
          expect(page).to have_selector("li", count: 3)
        end
      end

      it 'Shows the correct list of followers' do
        visit dashboard_path

        within ".followers" do
          expect(page).to have_content("n-flint")
          expect(page).to_not have_content("brickfungus")
        end
      end

      it 'the handle of each follower is a link to their profile on github' do
        visit dashboard_path

        within ".followers" do
          expect(page).to have_link("n-flint", href: "https://github.com/n-flint")
        end
      end
    end
  end
end
