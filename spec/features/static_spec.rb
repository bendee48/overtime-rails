require 'rails_helper'

RSpec.describe 'homepage', type: :feature do
  describe 'GET /' do
    it 'gets homepath' do
      visit root_path
      expect(page.status_code).to eql 200
    end
  end
end