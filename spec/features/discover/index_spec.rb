require 'rails_helper'

RSpec.describe "users discover path" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")

    visit user_discover_index_path(@user_1)
  end

  describe "as a user", :vcr do
    describe "when I visit the '/users/:id/discover' path" do
      it "I should see a button to discover top rated movies and a text field to search" do
        expect(page).to have_button("Find Top Rated Movies")
        expect(page).to have_field(:search)
        expect(page).to have_button("Find Movies")
      end

      it "when the user clicks on the top rated movies OR the search button, they should be taken to the movies results page" do
        click_on "Find Top Rated Movies"
        expect(page).to have_current_path(user_movies_path(@user_1))
        expect(page).to have_content("20 Results")
        # model method limit 20 top movies
        visit user_discover_index_path(@user_1)

        fill_in :search, with: "Harry Potter"
        click_on "Find Movies"
  
        expect(page).to have_current_path(user_movies_path(@user_1))
      end
    end
  end
end