require "rails_helper" 

RSpec.describe "User Show Page" do 
  before(:each) do 
    user_test_data
    visit "/users/#{@user1.id}"
  end

  describe "displays attributes" do 
    it "displays name and email" do 
      expect(page).to have_content("Email: #{@user1.email}")
    end
  end
  
  describe "US6 Dashboard (Show) Page" do
    it "I see user's name's Dashboard at the top of the page and a button to Discover Movies* " do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
    end
    
    it "US7 I go to a user dashbaord, and click 'Discover Movies button, I am redirected to a discover page '/users/:id/discover" do
      click_button("Discover Movies")
      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end

  describe "viewing parties" do 
    it "A section that lists viewing parties hosted by user" do
      within("#viewing_parties_hosting") do
        expect(page).to have_content("#{@viewing_party1.movie_title}- Viewing Party")
        expect(page).to have_content("#{@viewing_party2.movie_title}- Viewing Party")
        expect(page).to have_content("#{@viewing_party3.movie_title}- Viewing Party")
        expect(page).to_not have_content("#{@viewing_party5.movie_title}- Viewing Party")
      end
    end

    it "A section that lists viewing parties user is invited to" do
      within("#viewing_party_invitations") do
        save_and_open_page
        expect(page).to have_content("#{@viewing_party4.movie_title}- Viewing Party")
        expect(page).to have_content("#{@viewing_party5.movie_title}- Viewing Party")
        expect(page).to_not have_content("#{@viewing_party3.movie_title}- Viewing Party")
      end
    end
  end
end