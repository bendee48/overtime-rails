require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  let(:user) { User.create(email: "email@email.com", 
                           password: "password",
                           first_name: "Harry",
                           last_name: "Harrison") }

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do
    it 'loads successfully' do
      visit posts_path
      expect(page.status_code).to eql 200
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end

    it 'displays all posts' do
      post1 = Post.create!(date: Date.today, rationale: "post 1", user_id: user.id)
      post2 = Post.create!(date: Date.today, rationale: "post 2", user_id: user.id)
      visit posts_path
      expect(page).to have_content(/post 1|post 2/)
    end
  end

  describe 'new' do
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
  end
end