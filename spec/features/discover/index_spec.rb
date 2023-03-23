require 'rails_helper'

RSpec.describe '/discover', type: :feature do
  before do
    @steve = User.create!(name: "steve", email: "steve@steve.com")
        visit "/users/#{@steve.id}/discover"
  end
  describe "As a user" do
    context "When I visit the '/users/:id/discover' path, where :id, is the id of a valid user" do
      it "I should see a button to Discover Top Rated Movies" do
        expect(page).to have_button("Find Top Rated Movies")
      end

      it "I should see a text field to search by movie title" do
        expect(page).to have_field(:search)
        expect(page).to have_button("Find Movies")
      end

      it "When I click the button 'Find Top Rated Movies', I should be redirected to the movies index page" do
        click_button "Find Top Rated Movies"

        expect(current_path).to eq(user_movies_path(@steve.id))
      end

      it "When I fill in the text field and click 'Find Movies', I should be redirected to the movies index page" do
        fill_in :search, with: "The Matrix"
        click_button "Find Movies"

        expect(current_path).to eq(user_movies_path(@steve.id))
        expect(page).to have_content("The Matrix")
        expect(page).to have_content("Vote Average: 8.199")
        expect(page).to have_content("The Matrix Reloaded")
        expect(page).to have_content("Vote Average: 7.031")
        expect(page).to_not have_content("Hot Dog")
        expect(page).to have_link("The Matrix")
        expect(page).to have_link("The Matrix Reloaded")
      end

      it "Displays the message 'Movie Results for: keyword'" do
        fill_in :search, with: "The Matrix"
        click_button "Find Movies"
        
        expect(page).to have_content("Movie Results for: The Matrix")
      end
      

      describe "when I click on 'Find Top Rated Movies', I am taken to movies index (/users/:user_id/movies)" do
        before do
          click_button "Find Top Rated Movies"
        end

        it 'I should see title (as a link to the movie details page), vote average of the movie, and only 20 results' do
          expect(page).to have_content("The Godfather")
          expect(page).to have_content(8.7)
          expect(page).to have_link("The Godfather")
        end

        it 'I should see a button to return to the Discover page' do
          expect(current_path).to eq(user_movies_path(@steve.id))
          expect(page).to have_button("Return to Discover Page")

          click_button "Return to Discover Page"
          expect(current_path).to eq(user_discover_index_path(@steve.id))
        end
      end
    end
  end
end