require 'rails_helper'

describe 'when a video has a nil position' do
  it 'can run a rake task to update the db' do
    video = Video.new(
      'title' => 'Flow Control in Ruby',
      'description' => Faker::Hipster.paragraph(2, true),
      'video_id' => 'tZDBWXZzLPk',
      'thumbnail' => 'https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg',
      'position' => nil
    )
    video.save(validate: false)

    expect(video.position).to eq(nil)

    require 'rake'
    Rails.application.load_tasks
    Rake::Task['update_video_positions'].invoke

    updated_video = Video.first
    expect(updated_video.position).to eq(0)
  end
end
