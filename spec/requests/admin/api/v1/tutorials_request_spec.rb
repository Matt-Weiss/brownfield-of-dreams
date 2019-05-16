# frozen_string_literal: true

require 'rails_helper'

describe 'Admin Tutorials API' do
  it 'rejects a non-administrator' do
    tutorial1 = create(:tutorial)
    expect {put "/admin/api/v1/tutorial_sequencer/#{tutorial1.id}"}.to raise_error(ActionController::RoutingError)
  end
end
