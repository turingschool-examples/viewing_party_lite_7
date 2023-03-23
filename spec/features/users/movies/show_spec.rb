require "rails_helper"
RSpec.describe type: :feature do 
  describe "Movie Details Page", :vcr do
    let(:phil) { User.create!(name: "Philip", email: "philipjfry@gmail.com")}
    
    describe "When I visit the movie details page" do 

      before :each do 
        visit user_movie_path(phil, )
      end

      xit "displays a button to create a new viewing party" do
        click_button "Discover Top Rated Movies"
        click_link "The Godfather"
        expect(current_path).to eq("/users/#{phil.id}/movies/238")

        expect(page).to have_button("Create Viewing Party")
        click_button "Create Viewing Party"
        expect(current_path).to eq("/users/#{phil.id}/movies/238/viewing_party/new")
      end

      it "displays a button to return to the discover page" do 
        save_and_open_page
        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq(user_discover_index_path(phil))
      end

      xit "displays the movie's attributes" do 

      end

      it "displays the first 10 cast memebers of the movie"

      it "displays the total count of reviews with each reviews author and information"
    end
  end
end