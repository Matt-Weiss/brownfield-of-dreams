require 'rails_helper'

describe 'as an admin' do
  it 'can view new tutorial form' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/tutorials/new'

    expect(page).to have_field('Title')
  end
end
