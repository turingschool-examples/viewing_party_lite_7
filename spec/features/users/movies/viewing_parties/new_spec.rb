require "rails_helper"
RSpec.describe "Viewing Party New Page" do
  let(:phil) { User.create!(name: "Philip", email: "philipjfry@gmail.com") }

  describe "When I visit the movie details page", :vcr do
    before :each do
      # @godfather = Movie.new({movie_id: 238})
      visit user_discover_index_path(phil)
      click_button "Discover Top Rated Movies"
      click_link "The Godfather"
      click_button "Create Viewing Party"
    end

    it "should see the name of the movie rendered above a form" do
      expect(page).to have_content("The Godfather")
      expect("The Godfather").to appear_before("Duration")
    end

    it "should have a form with fields to fill in viewing party attributes" do
      save_and_open_page
      expect(page).to have_field("Duration")
      expect(page).to have_field("When")
      expect(page).to have_field("Start time")
    end

    # it "should have checkboxes in the form for each user in the system" do
    #   expect(page).to have_field("Duration")
    #   expect(page).to have_field("When")
    #   expect(page).to have_field("Start time")
    # end
  end
end