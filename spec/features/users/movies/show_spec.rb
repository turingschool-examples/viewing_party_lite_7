require "rails_helper"
RSpec.describe type: :feature do 
  describe "Movie Details Page", :vcr do
    let(:phil) { User.create!(name: "Philip", email: "philipjfry@gmail.com")}
    
    describe "When I visit the movie details page" do 

      before :each do
        # @godfather = Movie.new({movie_id: 238})
        visit user_discover_index_path(phil)
      end

      xit "displays a button to create a new viewing party" do
        click_button "Discover Top Rated Movies"
        click_link "The Godfather"
        expect(current_path).to eq("/users/#{phil.id}/movies/238")

        expect(page).to have_button("Create Viewing Party")
        click_button "Create Viewing Party"
        expect(current_path).to eq("/users/#{phil.id}/movies/238/viewing_party/new")
      end

      xit "displays a button to return to the discover page" do 

        expect(page).to have_button("Discover Movies")
        click_button "Discover Movies"
        expect(current_path).to eq(user_discover_index_path(phil))
      end

      it "displays the movie's attributes" do
        click_button "Discover Top Rated Movies"
        VCR.eject_cassette(name: 'spec/fixtures/vcr_cassettes/_type_feature_/Movie_Details_Page/When_I_visit_the_movie_details_page/displays_the_movie_s_attributes.yml')
        click_link "The Godfather"
        expect(page).to have_content("The Godfather")
      end

      it "displays the first 10 cast memebers of the movie"

      it "displays the total count of reviews with each reviews author and information"
    end
  end
end