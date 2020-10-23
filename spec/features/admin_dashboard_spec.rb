require 'rails_helper'

RSpec.describe 'Admin' do
  describe 'admin dashboard' do
    let(:user) { create(:user) }

    context 'when not logged in' do
      it 'redirects attempt to access admin dashboard' do
        visit admin_root_path
        expect(current_path).to eql new_user_session_path
      end
    end

    context 'when logged in but not admin user' do
      it 'redirects attempt to access admin dashboard' do
        login_as(user, scope: :user)
        visit admin_root_path
        expect(current_path).to eql root_path
      end
    end

    context 'when logged in and admin user' do
      it 'loads admin dashboard' do
        admin_user = create(:admin_user)
        login_as(admin_user, scope: :user)
        visit admin_root_path
        expect(current_path).to eql admin_root_path        
      end
    end
  end
end