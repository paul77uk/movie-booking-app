require 'rails_helper'
RSpec.describe 'show data fromm movies api', type: :system do
  before { create(:movie) }

  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('The Nun II')
    end
  end
end
