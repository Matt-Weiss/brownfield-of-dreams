require 'rails_helper'

describe 'as a visitor' do
  it 'does not show tutorials tagged for classroom' do
    mod_1_tutorial_data = {
      'title' => 'Back End Engineering - Module 1',
      'description' => 'Videos related to Mod 1.',
      'thumbnail' => 'https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg',
      'playlist_id' => 'PL1Y67f0xPzdNsXqiJs1s4NlpI6ZMNdMsb',
      'classroom' => false
    }

    m1_tutorial = Tutorial.create! mod_1_tutorial_data

    m1_tutorial.videos.create!(
      'title' => 'Flow Control in Ruby',
      'description' => Faker::Hipster.paragraph(2, true),
      'video_id' => 'tZDBWXZzLPk',
      'thumbnail' => 'https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg',
      'position' => 1
    )
    mod_4_tutorial_data = {
      'title' => 'Panels, Q&A with Turing staff and students',
      'description' => 'Video content for GearUp and PR.',
      'thumbnail' => 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg',
      'playlist_id' => 'PL1Y67f0xPzdOty2NDYKTRtxeoxvW1mAXu',
      'classroom' => true,
      'tag_list' => %w[Internet BDD Ruby]
    }
    m4_tutorial = Tutorial.create! mod_4_tutorial_data

    m4_tutorial.videos.create!(
      'title' => 'Kids That Code with Air Force Veteran George Hudson',
      'description' => Faker::Hipster.paragraph(2, true),
      'video_id' => 'gqnOAgAh1gg',
      'thumbnail' => 'https://i.ytimg.com/vi/gqnOAgAh1gg/hqdefault.jpg',
      'position' => 1
    )

    visit "/"

    expect(page).to_not have_content('Panels, Q&A with Turing staff and students')
    expect(page).to have_content('Back End Engineering - Module 1')
  end
end
