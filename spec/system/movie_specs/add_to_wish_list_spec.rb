require 'rails_helper'
RSpec.describe 'add movie on wishlist page', type: :system do
  before { @movie = create(:movie) }

  describe 'add the nun 2' do
    it 'shows the right content' do
      visit root_path
      # find('.heart', match: :first).click
      find_by_id(@movie.poster_path).click # click on heart icon to add to wishlist
      expect(page).to have_content('Wish List')
      expect(page).to have_content('The Nun II')
    end
  end
end
