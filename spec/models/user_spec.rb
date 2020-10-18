require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build_stubbed(:user) }

  describe 'creation' do
    context 'when valid' do
      it 'is created with valid attributes' do
        expect(user).to be_valid
      end
    end

    context 'when invalid' do
      it 'is not created without first and last name' do
        user.first_name = nil
        user.last_name = nil
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
