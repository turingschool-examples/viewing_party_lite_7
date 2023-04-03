require 'rails_helper'

RSpec.describe "/users/:id/movies/:movie_id/viewing_party/new" do
  describe "as a user, when I visit the new viewing party page" do
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com", password: "IamCaptain!")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com", password: "IamNumber2")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com", password: "IamData?")
      @geordi = User.create!(name: "Geordi La Forge", email: "chief-engineer@uss-enterprise.com", password: "IamEngineer!")

      @movie_response = File.read("spec/fixtures/moviedb/space_odyssey.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62?api_key=#{ENV["TMDB_API_KEY"]}")
        .to_return(status: 200, body: @movie_response, headers: {})

      cast_response = File.read("spec/fixtures/moviedb/space_cast.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/credits?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: cast_response, headers: {})

      reviews_response = File.read("spec/fixtures/moviedb/space_reviews.json")
      stub_request(:get, "https://api.themoviedb.org/3/movie/62/reviews?api_key=#{ENV["TMDB_API_KEY"]}")
      .to_return(status: 200, body: reviews_response, headers: {})
  
      
      # movie_hash = (:movie => @movie_response)
      # facade = MoviedbFacade.new(movie_id: 62).find_movie_info
      # @movie = Movie.new(movie: facade)
      
      visit "/users/#{@picard.id}/movies/62/viewing_party/new"
    end

    it "has the following information" do
      expect(page).to have_content("Viewing Party")
      expect(page).to have_content("Create a Movie Party for: 2001: A Space Odyssey")
      expect(page).to have_button("Discover Page")
      
      expect(page).to have_content("Viewing Party Details")
      expect(page).to have_field("Duration of Party", with: 149) #how to test for minimum value of 149 ?
      expect(page).to have_field("Day") #how to test for minimum value of Date.today ? 
      expect(page).to have_field("Start Time") #how to test for minimum value of Time.now.strftime("%H:%M") ?
      
      expect(page).to have_content("Invite Friends")
      expect(page).to have_unchecked_field("William Riker")
      expect(page).to have_unchecked_field("Data")
      expect(page).to have_unchecked_field("Geordi La Forge")
      expect(page).to_not have_unchecked_field("Jean-Luc Picard")

      expect(page).to have_field(:host_id, with: @picard.id, type: :hidden)
      expect(page).to have_field(:movie_title, with: "2001: A Space Odyssey", type: :hidden)
      expect(page).to have_field(:image, with: "/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg", type: :hidden)

      expect(page).to have_button("Create Party")
    end
    
    it "discover page link goes to the discover page" do
      click_button("Discover Page")
      expect(current_path).to eq("/users/#{@picard.id}/discover")
    end
      
    it "can create a new viewing party" do
      fill_in(:duration_minutes, with: 160)
      fill_in(:date, with: Date.today)
      fill_in(:start_time, with: Time.now + 2.hours)

      find("#host_id", visible: false).set(@picard.id)
      find("#movie_title", visible: false).set("2001: A Space Odyssey")
      find("#image", visible: false).set("/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg")
      check(@data.name)
      check(@geordi.name)
      
      click_button("Create Party")
      expect(current_path).to eq("/users/#{@picard.id}")
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

      #what Max's previous partner used last time in view: 
      #   <tr>
      #   <td>
      #     <td><%= f.label :check_boxes, "Invite Other Users" %></td><br>
      #     <td><%= f.collection_check_boxes(:user_ids, @users, :id, :name_with_email) %></td>
      #   <tr>

      # this is not complete. They wanted us to display the email also: