require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  subject(:post) { build_stubbed(:post)}

  describe 'creation' do
    context 'when valid' do
      it 'creates a post' do
        expect(post).to be_valid
      end
    end

    context 'when invalid' do
      it "doesn't create a post without a date, rationale and overtime request" do
        post.date = nil
        post.rationale = nil
        post.overtime_request = nil
        expect(post).to_not be_valid
      end

      it "rejects a post with 0 overtime hours" do
        post.overtime_request = 0.0
        expect(post).to_not be_valid
      end
    end
  end
end
