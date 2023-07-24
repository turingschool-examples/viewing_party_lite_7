require "rails_helper"

RSpec.describe "Movies Show Page" do
  describe "movie details page" do
    xit "return to discover movies page button" do
      # json_response = File.read('spec/fixtures/sandlot_id_search.json')
      # response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
      # to_return(status: 200, body: json_response)
      @movie = JSON.parse(response1.response.body, symbolize_names: true)
      @user = User.create!(name: "Email", email: "email@email.com", password: "secretpassword")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_movie_path(@user.id, @movie[:id])
      
      expect(page).to have_button "Discover Movies"
    end

    xit "create viewing party button" do
      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
      to_return(status: 200, body: json_response)
      @movie = JSON.parse(response1.response.body, symbolize_names: true)
      @user = User.create!(name: "Email", email: "email@email.com", password: "secretpassword")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_movie_path(@user.id, @movie.id)

      expect(page).to have_button "Create Viewing Party"
      click_button "Create Viewing Party"
      expect(current_path).to eq new_user_movie_viewing_party_path(@user.id, @movie.id)
    end
  end

  describe "movies show page without user session" do
    it "visitor cannot create viewing party without user session" do
      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
      to_return(status: 200, body: json_response)
      @movie = JSON.parse(response1.response.body, symbolize_names: true)
      visit movie_path(@movie[:id])
      expect(page).to have_content("#{@movie[:title]}")
      expect(page).to have_button "Create Viewing Party"
      click_button "Create Viewing Party"
      expect(current_path).to eq movie_path(@movie[:id])
      expect(page).to have_content "You must login or register to view this page"
    end
  end
end