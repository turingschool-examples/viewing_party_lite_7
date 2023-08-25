require "rails_helper"

RSpec.describe "user show page" do
  before :each do
    @user1 = User.create!(name: "Bob", email: "bob@gmail.com", id: 1)
    @user2 = User.create!(name: "Jane", email: "jane@gmail.com", id: 2)
    @user3 = User.create!(name: "Tom", email: "tom@yahoo.com", id: 3)
    @party1 = Party.create!(movie_id: 238, duration: 175, date: "12/12/23", start_time: "7:00", id:1)
    @userparty = UserParty.create!(user_id: 1, party_id: 1, host: true)
  end
  describe "User dashboard", :vcr do

    it "displays user's name dashboard at top of page" do
      visit "/users/1"
      
      expect(page).to have_content("Bob's Dashboard")
      expect(page).to_not have_content("Jane's Dashboard")
    end
    
    it "displays link to discover movies" do
      visit "/users/1"
      
      expect(page).to have_link("Discover Movies")
      
      visit "/users/2"
      
      expect(page).to have_link("Discover Movies")
      
      click_link "Discover Movies"
      
      expect(current_path).to eq("/users/2/discover")
    end
    
    it "displays section that lists viewing parties" do
      visit "/users/1"
      expect(page).to have_content("Viewing Parties")
      expect(page).to have_content(@party1.title(@party1.movie_id))
      expect(page).to have_content(@party1.duration)
      expect(page).to have_content(@party1.date)
      expect(page).to have_content(@party1.start_time)
    end
  end
end