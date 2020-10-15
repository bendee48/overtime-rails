require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    subject(:user) { described_class.create(email: "email@email.com", 
                                            password: "password",
                                            first_name: "Harry",
                                            last_name: "Harrison") }

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
end
