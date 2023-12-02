require 'rails_helper' 

describe 'New Viewing Party Page' do
  before :each do
    test_data
    oppenheimer_test_data

    visit new_user_movie_viewing_party_path(@user1, 872585)
  end

  describe 'New Viewing Party Creation Form' do
    it "has the expected labels and functionality listed" do
      expect(page).to have_content("Create a Movie Party for Oppenheimer")
      expect(page).to have_content("Viewing Party Details")
    end

    it "has expected functionality (Discover Page)" do
      expect(page).to have_button("Discover Page")
      click_button "Discover Page"
      expect(current_path).to eq(user_discover_index_path(@user1))
    end
    
    it 'has the following fields' do
      expect(page).to have_field(:duration, with: @oppenheimer.detailed_movie.runtime)
      expect(page).to have_content("Day")
      expect(page).to have_content("Start time")
    end
    
    it "option to invite other users is displayed if there are other users" do
      expect(page).to have_content("Invite Other Users")
      within("#invited_user-#{@user2.id}") do
        check("invitees[]")
      end
    end

    it "testing the selection of date and start time" do
      fill_in :day, with: "2024-01-01"
      fill_in :start_time, with: "04:00 PM"
      click_button "Create Party"
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("4:00 PM")
    end
    
    it "throws an error if the duration is less than the runtime" do
      fill_in :day, with: "2024-01-01"
      fill_in :start_time, with: "04:00 PM"
      fill_in :duration, with: "1"
      click_button "Create Party"

      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, 872585))
      expect(page).to have_content("Error! Viewing party duration cannot be less than the movie runtime, please fill this out correctly.")
    end

    it "can create a new viewing party if the duration entry is correct" do
      fill_in :day, with: "2024-01-01"
      fill_in :start_time, with: "04:00 PM"
      fill_in :duration, with: "200"
      click_button "Create Party"

      expect(current_path).to eq(user_path(@user1))
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("4:00 PM")
      expect(page).to have_content("Hosting")
    end

    it "can invite users and display on their respective pages" do
      fill_in :day, with: "2024-01-01"
      fill_in :start_time, with: "04:00 PM"
      fill_in :duration, with: "200"

      within("#invited_user-#{@user2.id}") do
        check("invitees[]")
      end
      within("#invited_user-#{@user3.id}") do
        check("invitees[]")
      end 
      click_button "Create Party"

      visit user_path(@user2)
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("4:00 PM")
      expect(page).to have_content("Invited")

      visit user_path(@user3)
      expect(page).to have_content("Oppenheimer")
      expect(page).to have_content("January 1, 2024")
      expect(page).to have_content("4:00 PM")
      expect(page).to have_content("Invited")
    end
  end
end