require 'rails_helper'

describe 'User Dashboard' do
  describe "When I visit '/users/:id' where :id is a valid user id" do
    it "I should see: '<user's name>'s Dashboard' at the top of the page, A button to Discover Movies, A section that lists viewing parties" do
      user = create(:user)
      visit "/users/#{user.id}"
      
      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to have_button "Discover Movies"
      expect(page).to have_css("#viewing_parties")
    end
    
    it "and click 'Discover Movies' button, I am redirected to a discover page '/users/:id/discover', where :id is the user id of the user who's dashboard I was just on." do
      user = create(:user)
      visit "/users/#{user.id}"
      click_button "Discover Movies"

      expect(current_path).to eq("/users/#{user.id}/discover")
    end

    # As a user,
    # When I visit a user dashboard,
    # I should see the viewing parties that the user has been invited 
    # to with the following details:
    #  Movie Image
    #  Movie Title, which links to the movie show page
    #  Date and Time of Event
    #  who is hosting the event
    #  list of users invited, with my name in bold
    #  I should also see the viewing parties that the user has created 
    #  with the following details:
    #  Movie Image
    #  Movie Title, which links to the movie show page
    #  Date and Time of Event
    #  That I am the host of the party
    #  List of friends invited to the viewing party

    it "I should see the viewing parties that the user has been invited 
      to with the following details:
      Movie Image
      Movie Title, which links to the movie show page
      Date and Time of Event
      who is hosting the event
      list of users invited, with my name in bold" do
      VCR.use_cassette('themoviedb_show_page_1') do
        user_1 = create(:user)
        user_2 = create(:user)
        party_1 = Party.create!(host_name: user_1.name, movie_id: 238, duration: 300, date: "08-01-2023", start_time: "7:00pm", host_id: user_1.id, movie_title: "The Godfather", thumbnail: "https://image.tmdb.org/t/p/w500/tmU7GeKVybMWFButWEGl2M4GeiP.jpg")
        user_party_1 = UserParty.create!(user_id: user_1.id, party_id: party_1.id)
        user_party_2 = UserParty.create!(user_id: user_2.id, party_id: party_1.id)
        party_2 = Party.create!(host_name: user_2.name, movie_id: 238, duration: 300, date: "08-02-2023", start_time: "7:01pm", host_id: user_2.id, movie_title: "The Godfather", thumbnail: "https://image.tmdb.org/t/p/w500/tmU7GeKVybMWFButWEGl2M4GeiP.jpg")
        user_party_3 = UserParty.create!(user_id: user_1.id, party_id: party_2.id)
        user_party_4 = UserParty.create!(user_id: user_2.id, party_id: party_2.id)
        visit "/users/#{user_1.id}"

        within "##{party_1.id}_info" do
          expect(page).to have_css(".movie_thumbnail")
          expect(page).to have_link("The Godfather")
          expect(page).to have_content("8-01-2023")
          expect(page).to have_content("7:00pm")
          expect(page).to have_content("Hosting")
          expect(page).to have_content("Hosted By: #{user_1.name}")
        end
        
        within "##{party_2.id}_info" do
        expect(page).to have_css(".movie_thumbnail")
        expect(page).to have_link("The Godfather")
        expect(page).to have_content("8-02-2023")
        expect(page).to have_content("7:01pm")
        expect(page).to have_content("Invited")
        expect(page).to have_content("Hosted By: #{user_2.name}")
        click_link "The Godfather"
        expect(current_path).to eq("/users/#{user_1.id}/movies/238")
        end
      end
    end
  end
end