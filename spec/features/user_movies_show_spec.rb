require 'rails_helper'

describe 'User Movies detail page' do
  describe "When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id," do
    it "I should see a Button to create a viewing party and a Button to return to the Discover Page.  " do
      VCR.use_cassette('themoviedb_details_1') do
        user = create(:user)
        movie_id = 238
        visit "/users/#{user.id}/movies/#{movie_id}"
        
        expect(page).to have_button("Create a viewing party")
        expect(page).to have_button("Discover Page")
      end
    end
    it "This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)," do
      VCR.use_cassette('themoviedb_details_2') do
        user = create(:user)
        movie_id = 238
        visit "/users/#{user.id}/movies/#{movie_id}"
        
        click_button("Create a viewing party")
        expect(current_path).to eq("/users/#{user.id}/movies/#{movie_id}/viewing_party/new")
      end
    end
    
    it "And I should see the following information about the movie:
    Movie Title
    Vote Average of the movie
    Runtime in hours & minutes
    Genre(s) associated to movie
    Summary description" do
    VCR.use_cassette('themoviedb_details_3') do
      user = create(:user)
      movie_id = 238
      visit "/users/#{user.id}/movies/#{movie_id}"
      
      expect(page).to have_content("The Godfather")
      expect(page).to have_content("8.7")
      expect(page).to have_content("175")
      expect(page).to have_content("Drama Crime")
      expect(page).to have_content("Summary")
    end
  end
  
  it "And I should see:  List the first 10 cast members (characters&actress/actors)" do
    VCR.use_cassette('themoviedb_details_4') do
      user = create(:user)
      movie_id = 238
      visit "/users/#{user.id}/movies/#{movie_id}"

      expect(page).to have_content("Character: Don Vito Corleone, Actor: Marlon Brando")
      expect(page).to have_content("Character: Michael Corleone, Actor: Al Pacino")
      expect(page).to have_content("Character: Sonny Corleone, Actor: James Caan")
    end
  end
  
  it "And I should see:  Count of total reviews and Each review's author and information" do
    VCR.use_cassette('themoviedb_details_5') do
      user = create(:user)
      movie_id = 238
      visit "/users/#{user.id}/movies/#{movie_id}"
      save_and_open_page
        expect(page).to have_content("Reviews: 5")
        within ("#authors") do
          expect(page).to have_content("Author: futuretv")
          expect(page).to have_content("Author: crastana")
          expect(page).to have_content("Author: drystyx")
          expect(page).to have_content("The Godfather is a film considered by most to be one of the greatest ever made.")
          expect(page).to have_content("the story telling is perfect")
        end
      end
    end
  end
end