require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build_stubbed(:user) }

  describe 'validations' do
    context 'with valid attributes' do
      it { is_expected.to be_valid }
    end

    context 'with invalid attributes' do
      it 'is invalid without a first name' do
        user.first_name = nil
        expect(user).to_not be_valid
      end

      it 'is invalid without a last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it 'is invalid without a phone number' do
        user.phone = nil
        expect(user).to_not be_valid
      end

      it 'is invalid if phone contains any non digits' do
        user.phone = 'hither-g.e'
        expect(user).to_not be_valid
      end

      it 'is invalid if phone is greater than 11 chars' do
        user.phone = '777777777777'
        expect(user).to_not be_valid
      end

      it 'is invalid if phone is less than 11 chars' do
        user.phone = '7777777777'
        expect(user).to_not be_valid
      end

      it 'is invalid without ssn number' do
        user.ssn = nil
        expect(user).to_not be_valid
      end
      
      it 'is invalid if ssn is not an integer' do
        user.ssn = '333g'
        expect(user).to_not be_valid
      end

      it 'is invalid if ssn is greater than 4 chars' do
        user.ssn = 12345
        expect(user).to_not be_valid
      end

      it 'is invalid if ssn is less than 4 chars' do
        user.ssn = 123
        expect(user).to_not be_valid
      end

      it 'is invalid without a company' do
        user.company = nil
        expect(user).to_not be_valid
      end
    end
  end

  describe '#full_name' do
    it "returns user's full name" do
      expect(user.full_name).to eql "DOE, John"
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple users' do
      employee_1 = create(:employee)
      employee_2 = create(:employee_2)
      admin = create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count).to eql 2
    end
  end
end
