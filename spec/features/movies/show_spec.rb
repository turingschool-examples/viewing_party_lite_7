require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  describe 'movie show page content' do
    it 'movie show page contents' do
      VCR.use_cassette('spec/fixtures/vcr_cassettes/movie_show_page/movie_show_page_contents.yml') do
        VCR.use_cassette('spec/fixtures/vcr_cassettes/movie_show_page/cast.yml') do
          VCR.use_cassette('spec/fixtures/vcr_cassettes/movie_show_page/reviews.yml') do
            visit "/users/#{user_1.id}/movies/238"

            expect(page).to have_button('Create Viewing Party')
            expect(page).to have_button('Discover Page')
            
            expect(page).to have_content('Title: The Godfather')
            expect(page).to have_content('Rating: 8.7')
            expect(page).to have_content('Runtime: 2h 55m')
            expect(page).to have_content('Drama')
            expect(page).to have_content('Crime')
            expect(page).to have_content('Description: Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
            expect(page).to have_content('Name: Marlon Brando')
            expect(page).to have_content('Name: Al Pacino')
            expect(page).to have_content('Name: James Caan')
            expect(page).to have_content('Name: Robert Duvall')
            expect(page).to have_content('Name: Richard S. Castellano')
            expect(page).to have_content('Name: Diane Keaton')
            expect(page).to have_content('Name: Talia Shire')
            expect(page).to have_content('Name: Gianni Russo')
            expect(page).to have_content('Name: Sterling Hayden')
            expect(page).to have_content('Name: John Marley')
            expect(page).to have_content('Total Reviews: 5')
            expect(page).to have_content('Author: futuretv')
            expect(page).to have_content('Author: crastana')
            expect(page).to have_content('Author: drystyx')
            expect(page).to have_content('Author: CinemaSerf')
            expect(page).to have_content('Author: Suresh Chidurala')
          end
        end
      end
    end
  end
end
