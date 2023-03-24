require 'rails-helper'

RSpec.describe "/users/:user_id/movies/:movid_id/viewing-party/new" do
  describe "as a user, when I visit the new viewing party page" do
    before :each do
      PartyUser.delete_all
      ViewingParty.delete_all
      User.delete_all
      
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      @user4 = create(:user)
      
      movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
        .to_return(status: 200, body: movie_response, headers: {})
        
      @movie = Movie.new(JSON.parse, symbolize_names: true)
      
      visit "/users/#{@user1.id}/movies/#{@movie.id}/viewing-party/new"
    end
    
    describe "I should see the name of the movie title rendered above a form" do
      it "has the following fields" do
        expect(page).to have_content("2001: A Space Odyssey")
      end
    end
  end
end




# I should see the name of the movie title rendered above a form with the following fields:
# 
# Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
# When: field to select date
# Start Time: field to select time
# Checkboxes next to each existing user in the system
# Button to create a party
# Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.