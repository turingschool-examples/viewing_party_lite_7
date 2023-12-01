require "rails_helper"

RSpec.describe "New Party Creation" do
  before(:each) do
    load_test_data
  end

  describe '#happy path' do
    it 'party new page', :vcr do
      visit "/users/#{@user2.id}/movies/238"

      expect(page).to have_content("The Godfather")
      expect(page).to have_button("Create a Viewing Party")
      click_button("Create a Viewing Party")

      expect(current_path).to eq("/users/#{@user2.id}/movies/238/viewing_party/new")
    end

    it "Create a new party", :vcr do
      visit user_path(@user2)
      expect(page).to_not have_content("Turing Viewing Party")

      visit "/users/#{@user2.id}/movies/238/viewing_party/new"

      expect(page).to have_content("The Godfather")

      fill_in :name, with: "Turing Viewing Party"
      fill_in :date, with: Date.today + 1
      select "08 PM", from: "_start_time_4i"
      select "15", from: "_start_time_5i"
      fill_in :duration, with: "200"
      check "Capitainlearyo"
      check "Slick Ric"

      click_button("Create Party")

      expect(current_path).to eq(user_path(@user2))

      visit user_path(@user2)
      expect(page).to have_content("Turing Viewing Party")

      visit user_path(@user1)
      expect(page).to have_content("Turing Viewing Party")
      # Not invited
      visit user_path(@user3)
      expect(page).to_not have_content("Turing Viewing Party")
    end
  end

  describe '#sad-path' do
    it 'Name field - blank', :vcr do
      visit "/users/#{@user2.id}/movies/238/viewing_party/new"

      expect(page).to have_content("The Godfather")

      fill_in :name, with: ""
      fill_in :date, with: Date.today + 1
      select "08 PM", from: "_start_time_4i"
      select "15", from: "_start_time_5i"
      fill_in :duration, with: "200"
      check "Capitainlearyo"
      check "Slick Ric"

      click_button("Create Party")

      expect(current_path).to eq("/users/#{@user2.id}/movies/238/viewing_party/new")
      expect(page).to have_content("Please fill in all fields")
    end

    it 'Date field - blank', :vcr do
      visit "/users/#{@user2.id}/movies/238/viewing_party/new"

      expect(page).to have_content("The Godfather")

      fill_in :name, with: "Turing Viewing Party"
      fill_in :date, with: ""
      select "08 PM", from: "_start_time_4i"
      select "15", from: "_start_time_5i"
      fill_in :duration, with: "200"
      check "Capitainlearyo"
      check "Slick Ric"

      click_button("Create Party")

      expect(current_path).to eq("/users/#{@user2.id}/movies/238/viewing_party/new")
      expect(page).to have_content("Please fill in all fields")
    end

    it 'Party duraction not long enough', :vcr do
      visit "/users/#{@user2.id}/movies/238/viewing_party/new"

      expect(page).to have_content("The Godfather")

      fill_in :name, with: "Turing Viewing Party"
      fill_in :date, with: Date.today + 1
      select "08 PM", from: "_start_time_4i"
      select "15", from: "_start_time_5i"
      fill_in :duration, with: "5"
      check "Capitainlearyo"
      check "Slick Ric"

      click_button("Create Party")

      expect(current_path).to eq("/users/#{@user2.id}/movies/238/viewing_party/new")
      expect(page).to have_content("Party must be as long or longer than movie")
    end
  end
end