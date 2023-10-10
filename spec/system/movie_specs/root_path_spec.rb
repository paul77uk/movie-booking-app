require 'rails_helper'
RSpec.describe 'show movies from database', type: :system do
  before { create(:movie) } # create a movie in the test database from the movies factory

  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('The Nun II')
    end
  end
end
