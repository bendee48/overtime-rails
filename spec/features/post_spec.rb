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
end