# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:password) }
  end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name: 'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name: 'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'instance methods' do
    it 'bookmarked_videos' do
      user = User.create(email: 'user@email.com', password: 'password', first_name: 'Jim', role: 0)
      tutorial_1 = Tutorial.create(title: 'How to Tie Your Shoes')
      tutorial_2 = Tutorial.create(title: 'How to Trip on Your Shoelaces')
      video_1 = Video.create(title: 'The Bunny Ears Technique 1', tutorial: tutorial_1, position: 1)
      video_2 = Video.create(title: 'The Bunny Ears Technique 2', tutorial: tutorial_1, position: 2)
      video_3 = Video.create(title: 'Trip on them', tutorial: tutorial_2, position: 1)
      user_video_1 = UserVideo.create(user_id: user.id, video_id: video_1.id)
      user_video_1 = UserVideo.create(user_id: user.id, video_id: video_3.id)
      user_video_1 = UserVideo.create(user_id: user.id, video_id: video_2.id)

      expect(user.bookmarked_videos).to eq([video_1, video_2, video_3])
      expect(user.bookmarked_videos[0].tutorial_name).to eq(tutorial_1.title)
    end
  end
end
