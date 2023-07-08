require "rails_helper"

RSpec.describe "Movies Show Page" do
  describe "movie details page" do
    before :each do
      @user1 = FactoryBot.create(:user)
      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/movie/11528").
        to_return(status: 200, body: json_response)
      movie = JSON.parse(response1.response.body, symbolize_names: true)
      @movie_id = movie[:id]  
    end
    
    it "return to discover page button" do
      visit user_movie_path(@user1.id, @movie_id)
      expect(page).to have_button "Discover Movies"
      click_button "Discover Movies"
      expect(current_path).to eq user_discover_index_path(@user1.id)
    end

    it "create viewing party button" do
      visit user_movie_path(@user1.id, @movie_id)
      expect(page).to have_button "Create Viewing Party"
      click_button "Create Viewing Party"
      expect(current_path).to eq new_user_movie_viewing_party_path(@user1.id, @movie[:id])
    end
  end
end