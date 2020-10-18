require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(email: "email@email.com", 
                            password: "password",
                            first_name: "Harry",
                            last_name: "Harrison") }
  subject(:post) { described_class.create(date: Date.today, rationale: "hi there", user_id: user.id) }

  describe 'creation' do
    context 'when valid' do
      it 'creates a post' do
        expect(post).to be_valid
      end
    end

    context 'when invalid' do
      it "doesn't create a post without a date and rationale" do
        post.date = nil
        post.rationale = nil
        expect(post).to_not be_valid
      end
    end
  end
end
