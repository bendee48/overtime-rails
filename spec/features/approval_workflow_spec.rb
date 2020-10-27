require 'rails_helper'

RSpec.describe 'Approval', type: :feature do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id, status: 'approved') }

  before do
    login_as(user, scope: :user)
  end

  describe 'Post' do
    it 'should not be editable once approved' do
      visit edit_post_path(post)
      expect(current_path).to eql posts_path
    end
  end
end