require 'rails_helper'

describe 'As a logged in user' do
 context 'When I visit /dashboard' do
    context 'Then I should be able to add friends' do
      before :each do
        followers = File.new('./spec/data/user_b_followers.txt')
        stub_request(:get, 'https://api.github.com/user/followers').to_return(followers)

        following = File.new('./spec/data/user_b_following.txt')
        stub_request(:get, 'https://api.github.com/user/following').to_return(following)

        create_friendship = File.new('./spec/data/friendship_request_successful.txt')
        stub_request(:post, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships').to_return(create_friendship)

        get_friendship = File.new('./spec/data/empty_friendships_list.txt')
        stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships/45211960').to_return(get_friendship)

        @user1 = create(:user,
                github_token: ENV["GITHUB_API_TOKEN_B"],
                   github_id: 45211960
                      )

        @user2 = create(:user,
                github_token: ENV["GITHUB_API_TOKEN_A"],
                   github_id: 3322920
                      )
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      end
      it 'I see a button to add followers if they have an account here' do
        visit dashboard_path

        within ".followers" do
          expect(page).to have_css("a[href='https://github.com/joequincy'] ~ form[action='/users/friendships']")
        end
      end

      it 'Users I have added as a friend are displayed' do
        visit dashboard_path

        within ".friends" do
          expect(page).to_not have_content(@user2.first_name)
        end

        get_friendship = File.new('./spec/data/friendships_list.txt')
        stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships/45211960').to_return(get_friendship)

        within ".followers" do
          click_button "Add as Friend"
        end

        within ".friends" do
          expect(page).to have_content(@user2.first_name)
        end
      end

      it 'I cannot make a friend request to a github user without a local account' do
        create_friendship = File.new('./spec/data/friendship_request_failed.txt')
        stub_request(:post, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships').to_return(create_friendship)
        visit dashboard_path

        within ".followers" do
          click_button "Add as Friend"
        end

        expect(current_path).to eq(dashboard_path)
        within ".errors" do
          expect(page).to have_content("Unable to befriend that user.")
        end
      end
    end
  end
end
