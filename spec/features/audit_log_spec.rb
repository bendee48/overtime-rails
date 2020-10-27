require 'rails_helper'

RSpec.describe 'AuditLog', type: :feature do
  let(:admin_user) { create(:admin_user) }
  let!(:audit_log) { create(:audit_log) }

  before do
    login_as(admin_user, scope: :user)
  end

  describe 'index' do
    context 'with admin user' do
      it 'successfully loads index page' do
        visit audit_logs_path
        expect(current_path).to eql audit_logs_path
        expect(page.status_code).to eql 200
      end

      it 'displays log content' do
        visit audit_logs_path
        expect(page).to have_content(audit_log.user.full_name)
      end
    end

    context 'with non admin user' do
      it 'denies access to audit log page' do
        logout admin_user
        regular_user = create(:user)
        login_as(regular_user, scope: :user)
        visit audit_logs_path
        expect(current_path).to eql root_path
      end
    end
  end
end