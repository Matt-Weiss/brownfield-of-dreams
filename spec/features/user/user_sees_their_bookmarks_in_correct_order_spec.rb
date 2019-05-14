require 'rails_helper'

describe 'As a registered user' do
  it 'can view bookmarks on dashboard in order by tutorial then position' do
    tutorial_1 = create(:tutorial, title: 'How to Tie Your Shoes')
    tutorial_2 = create(:tutorial, title: 'How to Trip on Your Shoelaces')
    video_1 = create(:video, title: 'The Bunny Ears Technique 1', tutorial: tutorial_1, position: 1)
    video_2 = create(:video, title: 'The Bunny Ears Technique 2', tutorial: tutorial_1, position: 2)
    video_3 = create(:video, title: 'The Bunny Ears Technique 3', tutorial: tutorial_1, position: 3)
    video_4 = create(:video, title: 'Step on them', tutorial: tutorial_2, position: 1)
    video_5 = create(:video, title: 'They Knot While You Walk', tutorial: tutorial_2, position: 2)
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorial_path(tutorial_2)
    find_link('They Knot While You Walk').click
    within ".title-bookmark" do
      click_on 'Bookmark'
    end
    find_link('Step on them').click
    within ".title-bookmark" do
      click_on 'Bookmark'
    end

    visit tutorial_path(tutorial_1)
    find_link('The Bunny Ears Technique 3').click
    within ".title-bookmark" do
      click_on 'Bookmark'
    end
    find_link('The Bunny Ears Technique 1').click
    within ".title-bookmark" do
      click_on 'Bookmark'
    end

    visit dashboard_path(user)

    within ".bookmarks" do
      expect(page).to have_selector('h4', count: 2)
      expect(page).to have_selector('li', count: 4)
      expect(page.body.index(tutorial_1.title)).to be < page.body.index(video_1.title)
      expect(page.body.index(video_3.title)).to be < page.body.index(tutorial_2.title)
    end
  end
end
