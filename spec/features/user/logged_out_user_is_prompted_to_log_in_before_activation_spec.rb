require 'rails_helper'

describe 'As a logged-out user' do
  context 'who is not yet active' do
    context 'visits activation page' do
      it 'is redirected to login page' do
        user = create(:user)

        visit user_activation_path(user)

        expect(current_path).to eq(login_path)
      end

      it 'is redirected back to activation path after login' do
        user = create(:user)

        visit user_activation_path(user)

        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password

        click_on 'Log In'

        expect(current_path).to eq(user_activation_path(user))
      end
    end
  end
end
