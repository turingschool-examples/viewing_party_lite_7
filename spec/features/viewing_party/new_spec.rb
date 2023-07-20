require "rails_helper"

RSpec.describe "Viewing Party New Page" do
  describe "Sandlot viewing party" do
    before :each do
      @user1 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
        to_return(status: 200, body: json_response)
      @movie = JSON.parse(response1.response.body, symbolize_names: true)
      @movie_id = @movie[:id]

      json_response2 = File.read('spec/fixtures/sandlot_cast.json')
      response2 = stub_request(:get, "https://api.themoviedb.org/3/movie/11528/credits").
        to_return(status: 200, body: json_response2)
      @movie_cast = JSON.parse(response2.response.body, symbolize_names: true)

      json_response3 = File.read('spec/fixtures/sandlot_reviews.json')
      response3 = stub_request(:get, "https://api.themoviedb.org/3/movie/447365/reviews").
        to_return(status: 200, body: json_response3)
      @movie_review = JSON.parse(response3.response.body, symbolize_names: true)
    end
    
    it "lists movie information" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      visit new_user_movie_viewing_party_path(@user1.id, @movie[:id])
      expect(page).to have_content("Title: The Sandlot")
      expect(page).to have_content("Vote Average: 7.517")
      expect(page).to have_content("Runtime: 1 hours 41 minutes")
      expect(page).to have_content("Genre(s): ")
      expect(page).to have_content("Overview: During a summer of friendship and adventure, one boy becomes a part of the gang, nine boys become a team and their leader becomes a legend by confronting the terrifying mystery beyond the right field wall.")
      expect(page).to have_content("Cast:")
      expect(page).to have_content("Tom Guiry")
      expect(page).to have_content("Review Count: 5")
      expect(page).to have_content("Review Author: The Movie Mob")
      expect(page).to have_content("Review Content: What a disappointment!")
    end

    it "has form to create viewing party" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      visit new_user_movie_viewing_party_path(@user1.id, @movie[:id])
      expect(page).to have_field("Party Duration:")
      expect(page).to have_field("When:")
      expect(page).to have_field("Start Time:")
      expect(page).to have_content(@user1.name.first)
      expect(page).to have_button("Create Party")
    end

    it "can create party" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
      visit new_user_movie_viewing_party_path(@user1.id, @movie[:id])
      date = Date.today
      fill_in "When:", with: date
      check "user_#{@user1.id}"
      click_button "Create Party"
      # Test Route with another stub?
    end
  end
end