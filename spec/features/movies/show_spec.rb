require 'rails_helper'

RSpec.describe '/users/:id/movies/:id', type: :feature do
  before(:each) do
    @user1 = create(:user)
  end

  describe 'When a user clicks on a movie link they are taken to that movies show page' do
    it 'They see a button to create a viewing party and a button to go back to discover page' do
      VCR.use_cassette('all_movie_data_550', allow_playback_repeats: true) do
        movie = MovieFacade.new.all_movie_data(550)
        visit user_movie_path(@user1, movie.id)

        expect(page).to have_button('Discover Page')
        expect(page).to have_button('Create Viewing Party')
      end
    end

    describe 'They see all the movie details' do
      xit 'title, average, runtime, genre(s), summary' do
        VCR.use_cassette('all_movie_data_550', allow_playback_repeats: true) do
          movie = MovieFacade.new.all_movie_data(550)
          visit user_movie_path(@user1, movie.id)
  
          expect(page).to have_content(movie.title)
          expect(page).to have_content(movie.vote_average)
          expect(page).to have_content(movie.runtime)
          expect(page).to have_content(movie.genre) #iterate over
          expect(page).to have_content(movie.summary)
        end
      end
    end
  end
end