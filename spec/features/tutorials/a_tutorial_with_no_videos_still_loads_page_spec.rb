require 'rails_helper'

describe 'tutorial features' do
  describe 'tutorial show page' do
    it 'will not throw an error if there are no videos' do
      mod_5_tutorial_data = {
        'title' => 'Get A Job, Hippie!',
        'description' => 'Get out of the basement!',
        'thumbnail' => 'https://i.ytimg.com/vi/R5FPYQgB6Zc/hqdefault.jpg',
        'playlist_id' => 'PL1Y67f0xPzdO4ZaAg1znkjVKjEHgaSW8U',
        'classroom' => false,
        'tag_list' => %w[Internet BDD Ruby]
      }
      m5_tutorial = Tutorial.create! mod_5_tutorial_data
      
      visit "/tutorials/#{m5_tutorial.id}"
      expect(page).to have_content("This tutorial doesn't have any videos yet!")
    end
  end
end
