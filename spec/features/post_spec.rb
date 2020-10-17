require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  describe 'index' do
    it 'loads successfully' do
      visit posts_path
      expect(page.status_code).to eql 200
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content('Posts')
    end
  end

  describe 'new' do
    it 'loads successfully' do
      visit new_post_path
      expect(page.status_code).to eql 200
    end

    it 'is created from new form page' do
      visit new_post_path

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'rationale content'

      click_on 'Submit'

      expect(page).to have_content('rationale content')
    end
  end
end