require 'rails_helper' 

RSpec.describe '/users/:id/movies#index' do
  before(:each) do
    @user1 = create(:user)
  end

  describe 'When a user visits the discovery page' do
    describe 'And they click on Discover Top Rated Movies' do
      it 'They are taken to the user movies index page where a list of the top movies is rendered' do
        VCR.use_cassette('top_20_movies', allow_playback_repeats: true) do
          top_movies = MovieFacade.top_rated_movies

          visit user_discover_path(@user1)
          click_button ('Discover Top Rated Movies')
          
          expect(current_path).to eq(user_movies_path(@user1))
          
          expect(page).to have_content('Viewing Party')
          expect(page).to have_button('Discover Page')
          
          top_movies.each do |movie|
            within "#movie_#{movie.id}" do
              expect(page).to have_content(movie.title)
              expect(page).to have_content("Vote Average: #{movie.vote_average}")
            end
          end
        end
      end

      it 'Each movie name listed is a link to their show page' do
        VCR.use_cassette('top_20_movies', allow_playback_repeats: true) do
          top_movies = MovieFacade.top_rated_movies
          first_movie = top_movies.first
          
          visit user_discover_path(@user1)
          click_button ('Discover Top Rated Movies')
          
          within "#movie_#{first_movie.id}" do
            click_link(first_movie.title)
          end
        end
      end
    end

    describe 'When they fill in the search field and click search' do
      xit 'They are taken to the movie index page where the 20 results for their search are listed' do
        VCR.use_cassette('search_movies_tremors', allow_playback_repeats: true) do

        end
      end
    end
  end
end
  