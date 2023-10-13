require "rails_helper"

RSpec.feature "Welcome Index" do
  it "has a header", :vcr do
    load_test_data

    visit user_discover_path(@anne)

    click_button "Find Top Rated Movies"

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

      expect(find("#movie-968051")).to have_link ("The Nun II")
      expect(find("#movie-968051")).to have_content("Vote Average: 7")
    end

    it "shows has link to movie show page" do
      load_test_data

      visit user_discover_path(@anne)
      
      click_button "Find Top Rated Movies"

      click_link "The Nun II"

      expect(page).to have_current_path("/users/#{@anne.id}/movies/968051")
    end
  end

  describe "keyword search" do
    # before do
    #   WebMock.allow_net_connect! 
    #   WebMock.disable! 
    #   VCR.eject_cassette 
    #   VCR.turn_off!(:ignore_cassettes => true)
    # end
    it "show a movie containing the keyword", :vcr do
      load_test_data

      visit user_discover_path(@anne)
      
      fill_in :search, with: "day dolphin"
      click_button "Find Movies"
      
      expect(page).to have_content("Dolphin")
    end

    it "shows movies containing the keyword", :vcr do
      load_test_data

      visit user_discover_path(@anne)
      
      fill_in :search, with: "dog"
      click_button "Find Movies"

      expect(page).to have_content("dog")
    end

    it "page still renders when nothing is entered into the search", :vcr do
      load_test_data

      visit user_discover_path(@anne)
      
      click_button "Find Movies"

      expect(page).to have_content("Viewing Party")
    end
  end
end
      

      