require "rails_helper"

RSpec.describe "Movie Results Page", type: :feature do
  before (:each) do
    @user1 = User.create!(name: "Scott DeVoss", email: "scottd@gmail.com")
    @user2 = User.create!(name: "Cory Powell", email: "coryp@yahoo.com")
  end

  describe "When I visit '/users/:id/discover'" do
    describe "And click on the 'Top Movies' or 'Search'" do
      it "I am taken to the movies results page where I see 'Title'(As a link to the Movie Details page - max 20)" do
        visit "/users/#{@user1.id}/discover"

        click_button "Find Top Rated Movies"

        expect(current_path).to eq "/users/#{@user1.id}/movies"
      end
      
    end
  end 

  describe "When I visit '/users/:id/movies'" do
    it "I see the 'Vote Average of the movies'" do
      visit "/users/#{@user1.id}/movies"

      expect(page).to have_content()

    end

    it "should have a button to return to the Discover Page" do
      visit "/users/#{@user1.id}/movies"

      expect(page).to have_button("Discover Page")

      click_button("Discover Page")

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end
  end
end 