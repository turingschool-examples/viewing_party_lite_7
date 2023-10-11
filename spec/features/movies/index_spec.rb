require "rails_helper"

RSpec.feature "Welcome Index" do
  xit "has a header" do
    load_test_data

    visit user_path(@anne)

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")

    click_link "Home"

    expect(page).to have_current_path("/")
  end

  describe "top rated movies", :vcr do
    it "shows movies" do
      load_test_data

      visit user_discover_path(@anne)
      
      click_button "Find Top Rated Movies"

      expect(page).to have_content("Nun")
    end
  end
end
      

      