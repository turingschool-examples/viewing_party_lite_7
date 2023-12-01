require 'rails_helper' 

describe 'New Viewing Party Page' do
  before :each do
    new_spec_test_data
    oppenheimer_test_data

    visit new_user_movie_viewing_party_path(@user1, 872585)
  end

  describe 'New Viewing Party Creation Form' do
    it "has the expected labels and functionality listed" do
      expect(page).to have_content("Create a Movie Party for Oppenheimer")
      expect(page).to have_content("Viewing Party Details")
      # expect(page).to_not have_content("Invite Other Users")
    end

    it "has expected functionality (Discover Page)" do
      expect(page).to have_button("Discover Page")
      click_button "Discover Page"
      expect(current_path).to eq(user_discover_index_path(@user1))
    end
    
    it 'has the following fields' do
      expect(page).to have_field(:duration)
      # expect(page).to have_field(:day)
      expect(page).to have_field(:start_time)
    end
    
    xit "option to invite other users is displayed if there are other users" do
      ## Having issues with this test, it seems like it won't loop through and iterate through each user, might be because it's within a form
      User.create!(name: "Anthea", email: "anthea@website.com")
      expect(page).to have_content("Invite Other Users")
      expect(page).to have_checkbox("Anthea (anthea@website.com)")
      User.create!(name: "Xero", email: "xero@spooky.wow")
      expect(page).to have_checkbox("Xero (xero@spooky.wow)")
    end
    
    it "has expected functionality (Create Party)" do
      expect(page).to have_field(:duration, with: @oppenheimer.detailed_movie.runtime)
      save_and_open_page
      select "2024", from: :year
      fill_in :start_time, with: "5:30"

      click_button "Create Party"
      expect(current_path).to eq(user_path(@user1))
      save_and_open_page
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("5:30 PM")
      expect(page).to have_content("Hosting")
    end
  end
end