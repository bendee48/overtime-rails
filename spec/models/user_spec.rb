require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build_stubbed(:user) }

  describe 'validations' do
    context 'when valid' do
      it 'is valid with valid attributes' do
        expect(user).to be_valid
      end
    end

    context 'when invalid' do
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

      it 'is invalid if phone is more than 11 chars' do
        user.phone = '777777777777'
        expect(user).to_not be_valid
      end

      it 'is invalid if phone is less than 11 chars' do
        user.phone = '7777777777'
        expect(user).to_not be_valid
      end
    end
  end

  describe '#full_name' do
    it "returns user's full name" do
      expect(user.full_name).to eql "DOE, John"
    end
  end
end
