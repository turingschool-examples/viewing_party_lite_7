require 'rails_helper'

RSpec.describe "/users/:id", type: :feature do
  describe "as a user, when I visit my user show page/dashboard" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com", password: "IamCaptain!")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com", password: "IamData?")
      
      @party1 = Party.create!(duration_minutes: 143, start_time: "08:00", date: Date.parse("2023-01-01"), movie_id: 62, host_id: @picard.id)
      # @party2 = Party.create!(duration_minutes: 90, start_time: "10:30", date: Date.parse("2023-02-02"), movie_id: 238, host_id: @riker.id)

      PartyUser.create!(party_id: @party1.id, user_id: @picard.id, host_id: @party1.host_id)
      PartyUser.create!(party_id: @party1.id, user_id: @data.id, host_id: @party1.host_id)

      # PartyUser.create!(party_id: @party2.id, user_id: @picard.id, host_id: @party2.host_id)
      # PartyUser.create!(party_id: @party2.id, user_id: @riker.id, host_id: @party2.host_id)
      # PartyUser.create!(party_id: @party2.id, user_id: @data.id, host_id: @party2.host_id)

      ############

      movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: movie_response, headers: {})
        
      cast_response = File.read("spec/fixtures/moviedb/space_cast.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/credits?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: cast_response, headers: {})

      reviews_response = File.read("spec/fixtures/moviedb/space_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/reviews?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: reviews_response, headers: {})
    end

    it "I see header, button to discover movies, a section that lists viewing parties" do
      visit "/"

      click_link("Log In")
      fill_in('Email', with: "captain@uss-enterprise.com")
      fill_in("Password:", with: "IamCaptain!")
      click_on("Log In")
      expect(current_path).to eq("/users/#{@picard.id}")

      expect(page).to have_content("Viewing Party")
      expect(page).to have_link("Home")
      expect(page).to have_content("#{@picard.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")

      within "#party_id-#{@party1.id}" do
        expect(page).to have_css("img[src^='https://image.tmdb.org/t/p/w154/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg']")
        expect(page).to have_content("2001: A Space Odyssey")
        expect(page).to have_content(@party1.date.strftime("%B %-d, %Y"))
        expect(page).to have_content(@party1.start_time.strftime("%I:%M %p"))
        expect(page).to have_content("Hosting")
        expect(page).to have_content("Friends who are attending")
        expect(page).to have_content(@data.name)

        expect(page).to_not have_content(@riker.name)
      end

      # In order for this to work, need to 1) change facade method OR 2) add fixture files for Godfather cast&reviews
      # within "#party_id-#{@party2.id}" do
        # expect(page).to have_content("The Godfather")
        # expect(page).to have_css("img[src^='https://image.tmdb.org/t/p/w154/3bhkrj58Vtu7enYsRolD1fZdja1.jpg']")
        # expect(page).to have_content(@party2.start_time.strftime("%I:%M %p"))
        # expect(page).to have_content(@party2.date.strftime("%B %-d, %Y"))
        # expect(page).to have_content("Invited")
        # expect(page).to have_content(@riker.name)
        # expect(page).to have_content(@data.name)
        # expect(page).to have_content(@picard.name)
      # end
    end
    
    it 'has a link to home that returns to the landing page' do
      visit "/users/#{@picard.id}"

      click_link("Home")
      
      # expect(current_path).to eq(root_path)
      expect(current_path).to eq("/")
    end

    it "when I click the discover button, I'm redirected to '/users/:id/discover' page" do
      visit "/"

      click_link("Log In")
      expect(current_path).to eq("/login")
      fill_in('Email', with: "captain@uss-enterprise.com")
      fill_in("Password:", with: "IamCaptain!")
      click_on("Log In")
      expect(current_path).to eq("/users/#{@picard.id}")

      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{@picard.id}/discover")
    end

    it "can display a single movie image & title" do
      visit "/"

      click_link("Log In")
      expect(current_path).to eq("/login")
      fill_in('Email', with: "captain@uss-enterprise.com")
      fill_in("Password:", with: "IamCaptain!")
      click_on("Log In")
      expect(current_path).to eq("/users/#{@picard.id}")

      expect(page).to have_content("2001: A Space Odyssey")
      expect(page).to have_css("img[src^='https://image.tmdb.org/t/p/w154/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg']")
    end
  end
end