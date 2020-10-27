require 'rails_helper'

RSpec.describe 'Homepage' do
  context 'admin homepage' do
    let(:admin_user) { create(:admin_user) }
    let!(:pending_approval) { create(:post) }

    before do
      login_as(admin_user, scope: :user)
    end

    describe 'pending approvals' do
      it 'can be approved' do
        visit root_path
        expect { click_on("approve-btn-#{pending_approval.id}") }.to change { Post.submitted.count }.by(-1)
      end
    end
  end
end