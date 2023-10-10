require 'rails_helper'
RSpec.describe 'add movie on wishlist page', type: :system do
  before { @movie = create(:movie) } # create a movie in the test database

  describe 'add the nun 2' do
    it 'shows the right content' do
      visit root_path
      # find('.heart', match: :first).click
      find_by_id(@movie.poster_path).click # click on heart icon to add to wishlist
      expect(page).to have_content('Wish List')
      expect(page).to have_content('The Nun II')
    end
  end

  describe 'can\'t add the nun 2 twice' do
    it 'stays on index page and doesn\'t add the same movie' do
      create(:favourite) # create a favorite to test if it doesn't add it twice
      visit root_path
      find_by_id(@movie.poster_path).click # click on heart icon to add to wishlist
      expect(page).to have_content('Movies') # stays on index page
      expect(page).to have_content('The Nun II')

      visit new_movie_path
      expect(page).to have_content('Wish List')
      expect(page).to have_content('The Nun II', count: 1) # no duplicate movie in wishlist
    end
  end
end
