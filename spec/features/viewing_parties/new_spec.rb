require 'rails_helper'

RSpec.describe 'New Viewing Party' do
  before :each do
    @user_1 = User.create!(name: "User1", email: "email1@example.com")
  end
  describe 'happy path' do
    it 'can create a new viewing party' do
      visit user_movies_path(@user_1)
 
      expect(page).to have_link("Parasite")
      click_link "Parasite"
      expect(page).to have_button("New Viewing Party")
      click_button "New Viewing Party"

      fill_in :duration, with: 240
      fill_in :event_date, with: "2024-05-09"
      fill_in :start_time, with: "1:30 PM"
      fill_in :name, with: "Super Mega Ultra Party"

      click_button "Create"

      expect(current_path).to eq("/users/#{@user_1.id}/movies/496243/viewing-party/new")
      expect(page).to have_content("Viewing party successfully created! Now it's time to invite your friends!")

    end

    xit 'can invite other users to viewing party' do
      visit root_path
      expect(page).to_not have_content("Ralph")
      visit "/register"

      fill_in "Name", with: "Ralph"
      fill_in "Email", with: "lol@yahoo.com"
      click_button "Register"
      new_user = User.find_by(email: "lol@yahoo.com")
      expect(current_path).to eq(user_path(new_user))
      expect(page).to have_content("User successfully created.")
      
      visit root_path
      expect(page).to have_content("Ralph")
    end
  end

  describe 'sad path' do
    it 'will display an error message if movie runtime > viewing party duration' do
      visit user_movies_path(@user_1)
 
      expect(page).to have_link("Parasite")
      click_link "Parasite"
      expect(page).to have_button("New Viewing Party")
      click_button "New Viewing Party"

      fill_in :duration, with: 45
      fill_in :event_date, with: "2024-05-09"
      fill_in :start_time, with: "1:30 PM"
      fill_in :name, with: "Super Mega Ultra Party"

      click_button "Create"

      expect(current_path).to eq("/users/#{@user_1.id}/movies/496243/viewing-party/new")
      expect(page).to have_content("Creation unsuccessful. Your viewing party can't take less time than the movie!")
    end
  end
end