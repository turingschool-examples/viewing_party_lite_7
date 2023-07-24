require "rails_helper"

RSpec.describe "User Show Page" do
  describe "User Dashboard" do
    before :each do
      @user = User.create!(name: "Email", email: "email@email.com", password: "secretpassword")
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
        to_return(status: 200, body: json_response)
      movie = JSON.parse(response1.response.body, symbolize_names: true)
      @movie_id = movie[:id] 
      @movie = Movie.new(movie)

      @view_party1 = ViewingParty.create!(duration: 300, date_time: Date.today, api_movie_id: @movie_id)
      @view_user1 = ViewingUser.create!(user_id: @user1.id, viewing_party_id: @view_party1.id, host: 1)
    end
    
    it "dashboard title" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_path(@user.id)

      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it "discover movies button" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_path(@user.id)
      expect(page).to have_button "Discover Movies"
    end

    it "viewing party list" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_path(@user.id)
      expect(page).to have_content("Available Viewing Parties")
    end
  end

  describe "user dashboard viewing parties" do
    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @user3 = FactoryBot.create(:user)
      @user4 = FactoryBot.create(:user)

      json_response = File.read('spec/fixtures/sandlot_id_search.json')
      response1 = stub_request(:get, "https://api.themoviedb.org/3/search/movie/11528").
        to_return(status: 200, body: json_response)
      movie = JSON.parse(response1.response.body, symbolize_names: true)
      @movie_id = movie[:id] 
      @movie = Movie.new(movie)

      @view_party1 = ViewingParty.create!(duration: 300, date_time: Date.today, api_movie_id: @movie_id)
      @view_user1 = ViewingUser.create!(user_id: @user1.id, viewing_party_id: @view_party1.id, host: 1)
      visit user_path(@user1.id)
    end
    xit "shows invites to viewing parties" do
      within "#parties" do
        expect(page).to have_content("Viewing Party Invites")
        # expect(page).to have_content(movie image)
        expect(page).to have_content("Movie Title: #{@movie.title}")
        expect(page).to have_link("#{@movie.title}")
        # expect(page).to have_content("Date & Time: Sat, 08 Jul 2023 00:00:00.000000000 UTC +00:00")
        expect(page).to have_content("Party Host: #{@user1.name}")
        # expect(page).to have_content("Party Guest Invitees: ")
      end
    end

    xit "shows hosting viewing parties" do
      within "#parties" do
        expect(page).to have_content("Viewing Parties as Host")
        # expect(page).to have_content(movie image)
        expect(page).to have_content("Movie Title: #{@movie.title}")
        expect(page).to have_link("#{@movie.title}")
        # expect(page).to have_content("Date & Time: Sat, 08 Jul 2023 00:00:00.000000000 UTC +00:00")
        expect(page).to have_content("Party Host: #{@user1.name}")
        # expect(page).to have_content("Party Guest Invitees: ")
      end
    end
  end
end