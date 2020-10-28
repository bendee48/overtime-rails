require 'rails_helper'

RSpec.describe 'Homepage' do
  context 'admin user' do
    let(:admin_user) { create(:admin_user) }
    let!(:pending_approval) { create(:post) }

    before do
      login_as(admin_user, scope: :user)
    end

    describe 'pending approval' do
      it 'can be approved' do
        visit root_path
        expect { click_on("approve-btn-#{pending_approval.id}") }.to change { Post.submitted.count }.by(-1)
      end
    end
  end

  context 'employee user' do
    let(:user) { create(:user) }
    let!(:pending_audit) { create(:audit_log, user_id: user.id) }

    before do
      login_as(user, scope: :user)
    end

    describe 'pending audit log status' do
      it 'can be changed by the employee' do
        visit root_path
        click_on("audit-log-confirm#{pending_audit.id}")
        expect(pending_audit.reload.status).to eql 'confirmed'
      end
    end
  end
end