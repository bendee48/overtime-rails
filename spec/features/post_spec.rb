require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user_id: user.id) }

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
      post2 = create(:post, rationale: "Some more content", user_id: user.id)
      visit posts_path
      expect(page).to have_content(/Some content|Some more content/)
    end

    it 'only displays posts created by current user' do
      user2 = create(:second_user)
      post2 = create(:post, user_id: user2.id)
      visit posts_path
      expect(page).to have_content(/DOE, John/)
      expect(page).to_not have_content(/USER, Second/)
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

    it 'can only be edited by owner or admin' do
      logout user
      user2 = create(:user, first_name: "Second", last_name: "User")
      login_as(user2, scope: :user)
      visit edit_post_path(post)
      expect(current_path).to eql posts_path
    end
  end

  describe '#delete' do
    it 'can be deleted' do
      visit posts_path
      click_link "delete-from-index-#{post.id}"
      expect(page.status_code).to eql 200
    end
  end
end