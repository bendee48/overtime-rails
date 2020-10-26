require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build_stubbed(:user) }

  describe 'creation' do
    context 'when valid' do
      it 'is valid attributes with valid attributes' do
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
    end
  end

  describe '#full_name' do
    it "returns user's full name" do
      expect(user.full_name).to eql "DOE, John"
    end
  end
end
