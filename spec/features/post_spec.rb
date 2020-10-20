require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  describe '#index' do
    it 'loads successfully' do
      visit posts_path
      expect(page.status_code).to eql 200
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end

    it 'displays all posts' do
      post1 = create(:post)
      post2 = create(:post, rationale: "Some more content")
      visit posts_path
      expect(page).to have_content(/Some content|Some more content/)
    end
  end

  describe '#new' do
    before do
      visit new_post_path
    end

    it 'loads successfully' do
      expect(page.status_code).to eql 200
    end

    it 'is created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'rationale content'

      click_on 'Submit'

      expect(page).to have_content('rationale content')
    end

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'associated user'

      click_on 'Submit'

      expect(User.last.posts.last.rationale).to eql 'associated user'
    end

    it 'has a link in the navbar' do
      click_link 'new-post-nav'
      expect(page.status_code).to eql 200
    end
  end

  describe '#edit' do
    let!(:post) { create(:post) }

    it 'can be edited by clicking the edit on index page' do
      visit posts_path
      click_link "edit-#{post.id}"
      expect(page.status_code).to eql 200
    end

    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'edited content'

      click_on 'Submit'

      expect(page).to have_content 'edited content'
    end
  end
end