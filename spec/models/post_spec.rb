require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build_stubbed(:post)}

  describe 'validations' do
    context 'with valid attributes' do
      it { is_expected.to be_valid }
    end

    context 'with invalid attributes' do
      it 'is is invalid without an associated user' do
        post.user_id = nil
        expect(post).to_not be_valid
      end

      it 'is is invalid without a date' do
        post.date = nil
        expect(post).to_not be_valid
      end

      it 'is invalid without work performed' do
        post.work_performed = nil
        expect(post).to_not be_valid
      end

      it 'is invalid without a daily_hours attr' do
        post.daily_hours = nil
        expect(post).to_not be_valid
      end

      it 'is invalid with 0 hours' do
        post.daily_hours = 0.0
        expect(post).to_not be_valid
      end
    end
  end
end
