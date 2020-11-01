require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  let(:employee) { create(:employee) }
  let!(:post) { create(:post, user_id: employee.id) }

  before do
    login_as(employee, scope: :user)
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
      post2 = create(:post, rationale: "Some more content", user_id: employee.id)
      visit posts_path
      expect(page).to have_content(/Some content|Some more content/)
    end

    it 'only displays posts created by current user' do
      employee_2 = create(:employee_2)
      post2 = create(:post, user_id: employee_2.id)
      visit posts_path
      expect(page).to have_content(/ROSEN, Michael/)
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
      fill_in 'post[daily_hours]', with: 2.5

      expect { click_on 'Submit' }.to change { Post.count }.by(1)
    end

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'associated user'
      fill_in 'post[daily_hours]', with: 2.5

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
      logout employee
      employee_2 = create(:employee_2)
      login_as(employee_2, scope: :user)
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