# frozen_string_literal: true

prework_tutorial_data = {
  'title' => 'Back End Engineering - Prework',
  'description' => 'Videos for prework.',
  'thumbnail' => 'https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg',
  'playlist_id' => 'PL1Y67f0xPzdN6C-LPuTQ5yzlBoz2joWa5',
  'classroom' => false
}
prework_tutorial = Tutorial.create! prework_tutorial_data

prework_tutorial.videos.create!(
  'title' => 'Prework - Environment Setup',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'qMkRHW9zE1c',
  'thumbnail' => 'https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg',
  'position' => 1
)
prework_tutorial.videos.create!(
  'title' => 'Prework - SSH Key Setup',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'XsPVWGKK0qI',
  'thumbnail' => 'https://i.ytimg.com/vi/XsPVWGKK0qI/hqdefault.jpg',
  'position' => 2
)
prework_tutorial.videos.create!(
  'title' => 'Prework - Strings',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'iXLwXvev4X8',
  'thumbnail' => 'https://i.ytimg.com/vi/iXLwXvev4X8/hqdefault.jpg',
  'position' => 3
)
prework_tutorial.videos.create!(
  'title' => 'Prework - Arrays',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'c2UnIQ3LRnM',
  'thumbnail' => 'https://i.ytimg.com/vi/c2UnIQ3LRnM/hqdefault.jpg',
  'position' => 4
)

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
m1_tutorial.videos.create!(
  'title' => 'How to use SimpleCov',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'WMgDD2lU5nY',
  'thumbnail' => 'https://i.ytimg.com/vi/WMgDD2lU5nY/hqdefault.jpg',
  'position' => 2
)

mod_3_tutorial_data = {
  'title' => 'Back End Engineering - Module 3',
  'description' => 'Video content for Mod 3.',
  'thumbnail' => 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg',
  'playlist_id' => 'PL1Y67f0xPzdOq2FcpWnawJeyJ3ELUdBkJ',
  'classroom' => false,
  'tag_list' => %w[Internet BDD Ruby]
}
m3_tutorial = Tutorial.create! mod_3_tutorial_data

m3_tutorial.videos.create!(
  'title' => 'Customizing JSON in your API',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'cv1VQ_9OqvE',
  'thumbnail' => 'https://i.ytimg.com/vi/cv1VQ_9OqvE/hqdefault.jpg',
  'position' => 1
)
m3_tutorial.videos.create!(
  'title' => 'Rails Integration Testing',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'J7ikFUlkP_k',
  'thumbnail' => 'https://i.ytimg.com/vi/J7ikFUlkP_k/hqdefault.jpg',
  'position' => 2
)
m3_tutorial.videos.create!(
  'title' => 'BEE - M3 - Building An Internal API',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'R5FPYQgB6Zc',
  'thumbnail' => 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg',
  'position' => 3
)
m3_tutorial.videos.create!(
  'title' => 'Stubbing External API Calls in Rails',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'FUYoJTtfJ20',
  'thumbnail' => 'https://i.ytimg.com/vi/FUYoJTtfJ20/hqdefault.jpg',
  'position' => 4
)
m3_tutorial.videos.create!(
  'title' => 'B3 - Making Fetch Happen',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'lqx4sD0E6eY',
  'thumbnail' => 'https://i.ytimg.com/vi/lqx4sD0E6eY/hqdefault.jpg',
  'position' => 5
)
m3_tutorial.videos.create!(
  'title' => 'BDD - Consuming an API',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'FcgkfZEv_LI',
  'thumbnail' => 'https://i.ytimg.com/vi/FcgkfZEv_LI/hqdefault.jpg',
  'position' => 6
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
m4_tutorial.videos.create!(
  'title' => 'How to Be Successful at a Coding Bootcamp',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'kXZlr-ytcTk',
  'thumbnail' => 'https://i.ytimg.com/vi/kXZlr-ytcTk/hqdefault.jpg',
  'position' => 2
)
m4_tutorial.videos.create!(
  'title' => 'Ask a Bootcamp Leader: Jorge Téllez',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'j5wNkAOQgaM',
  'thumbnail' => 'https://i.ytimg.com/vi/j5wNkAOQgaM/hqdefault.jpg',
  'position' => 3
)
m4_tutorial.videos.create!(
  'title' => 'Turing School of Software & Design',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => '6b0wCed8BPU',
  'thumbnail' => 'https://i.ytimg.com/vi/6b0wCed8BPU/hqdefault.jpg',
  'position' => 4
)
m4_tutorial.videos.create!(
  'title' => 'Women @ Turing',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'IUeIXoImPJI',
  'thumbnail' => 'https://i.ytimg.com/vi/IUeIXoImPJI/hqdefault.jpg',
  'position' => 5
)
m4_tutorial.videos.create!(
  'title' => 'Racial Diversity in Coding Bootcamps Webinar',
  'description' => Faker::Hipster.paragraph(2, true),
  'video_id' => 'K7DsSbaT_aM',
  'thumbnail' => 'https://i.ytimg.com/vi/K7DsSbaT_aM/hqdefault.jpg',
  'position' => 6
)

mod_5_tutorial_data = {
  'title' => 'Get A Job, Hippie!',
  'description' => 'Get out of the basement!',
  'thumbnail' => 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg',
  'playlist_id' => 'PL1Y67f0xPzdO4ZaAg1znkjVKjEHgaSW8U',
  'classroom' => true,
  'tag_list' => %w[Internet BDD Ruby]
}
m5_tutorial = Tutorial.create! mod_5_tutorial_data

User.create!(email: 'admin@example.com', first_name: 'Bossy', last_name: 'McBosserton', password: 'password', role: :admin)
User.create!(email: ENV['JON_EMAIL'], first_name: 'Jon', last_name: 'Peterson', password: ENV['JON_DEMO_PASSWORD'], role: :default, github_token: ENV["GITHUB_API_TOKEN_A"], github_id: 3322920)
User.create!(email: ENV['MATT_EMAIL'], first_name: 'Matt', last_name: 'Weiss', password: ENV['MATT_DEMO_PASSWORD'], role: :default, github_token: ENV["GITHUB_API_TOKEN_B"], github_id: 45211960)
