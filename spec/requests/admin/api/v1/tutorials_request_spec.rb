# frozen_string_literal: true

require 'rails_helper'

describe 'Admin Tutorials API' do
  it 'rejects a non-administrator' do
    tutorial1 = create(:tutorial)
    expect {put "/admin/api/v1/tutorial_sequencer/#{tutorial1.id}"}.to raise_error(ActionController::RoutingError)
  end

  it 'reorders the tutorial videos' do
    tutorial1 = create(:tutorial)
    tutorial2 = create(:tutorial)

    video1 = create(:video, tutorial_id: tutorial1.id)
    video2 = create(:video, tutorial_id: tutorial1.id)
    video3 = create(:video, tutorial_id: tutorial2.id)
    video4 = create(:video, tutorial_id: tutorial2.id)

    admin = create(:admin)
    allow_any_instance_of(Admin::Api::V1::BaseController).to receive(:current_user).and_return(admin)

    sorted_ids = [video2.id,video1.id].to_json
    put "/admin/api/v1/tutorial_sequencer/#{tutorial1.id}",
        params: sorted_ids,
        env: {
          'HTTP_ACCEPT' => 'application/json',
          'CONTENT_TYPE' => 'application/json'
        }
    expect(Video.find(video2.id).position).to eq(1)
    expect(Video.find(video1.id).position).to eq(2)
  end
end
