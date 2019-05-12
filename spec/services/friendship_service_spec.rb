require 'rails_helper'

describe FriendshipService do
  context "instance methods" do
    before :each do
    create_friendship = File.new('./spec/data/friendship_request_successful.txt')
    stub_request(:post, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships').to_return(create_friendship)

    get_friendship = File.new('./spec/data/friendships_list.txt')
    stub_request(:get, 'https://young-mountain-25786.herokuapp.com/api/v1/friendships').to_return(get_friendship)

    @user1 = create(:user,
            github_token: ENV["GITHUB_API_TOKEN_B"],
               github_id: 45211960
            )
    @user2 = create(:user,
            github_token: ENV["GITHUB_API_TOKEN_A"],
               github_id: 3322920
            )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "adds friends" do
      service = FriendshipService.new(@user1)
      result = service.add_friend(@user2)

      expect(result).to be_a(Hash)
      expect(result[:attributes]).to have_key(:recipient)
    end

    it "gets friendships" do
      service = FriendshipService.new(@user1)
      result = service.friends

      expect(result).to be_a(Array)
      expect(result[0][:attributes]).to have_key(:initiator)
      expect(result[0][:attributes][:initiator]).to eq(@user1.github_id)
    end
  end
end
