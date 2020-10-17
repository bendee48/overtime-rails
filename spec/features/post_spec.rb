require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  describe 'index' do
    before do
      visit posts_path
    end

    it 'loads successfully' do
      expect(page.status_code).to eql 200
    end

    it 'has a title of Posts' do
      expect(page).to have_content('Posts')
    end
  end

  describe 'new' do
    let(:user) { User.create(email: "email@email.com", 
                             password: "password",
                             first_name: "Harry",
                             last_name: "Harrison") }

    before do
      login_as(user, scope: :user)
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