require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  subject(:audit_log) { create(:audit_log) }
  let(:user) { create(:user) }

  describe 'validations' do
    context 'with valid attributes' do
      it { is_expected.to be_valid }
    end

    context 'with invalid attributes' do
      it 'is invalid without a user' do
        audit_log.user_id = nil
        expect(audit_log).to_not be_valid
      end

      it 'is invalid without a status' do
        audit_log.status = nil
        expect(audit_log).to_not be_valid
      end

      it 'is invalid without a start date' do
        audit_log.start_date = nil
        expect(audit_log).to_not be_valid
      end
    end
  end

  describe 'create' do
    it 'has a start date 6 days ago' do
      audit_log2 = AuditLog.create(user_id: user.id)
      expect(audit_log2.start_date).to eql Date.today - 6.days
    end
  end
end
