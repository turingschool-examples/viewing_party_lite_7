require 'rails_helper'

RSpec.describe "New Viewing party page" do
  describe "display" do
    before do 
      test_data
      test_movie_details
      @movie_1 = Movie.new(@data)
    end

    it "has a form with all necessary fields", :vcr do
      visit new_user_movie_party_path(@user_1, @movie_1.id)
      save_and_open_page

      expect(page).to have_content("Viewing Party Details")
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_field("duration")
      expect(page).to have_field("[day(1i)]")
      expect(page).to have_field("[day(2i)]")
      expect(page).to have_field("[day(3i)]")
      expect(page).to have_field("[time(4i)]")
      expect(page).to have_field("[time(5i)]")
      expect(page).to have_field(@user_1.id.to_s, type: 'checkbox')
      expect(page).to have_field(@user_2.id.to_s, type: 'checkbox')
      expect(page).to have_field(@user_3.id.to_s, type: 'checkbox')
      expect(page).to have_field(@user_4.id.to_s, type: 'checkbox')
      expect(page).to have_field(@user_5.id.to_s, type: 'checkbox')
      expect(page).to have_button("Create Party")
    end
  end

  describe "function" do
    before do 
      test_data
      test_movie_details
      @movie_1 = Movie.new(@data)
    end

    it "creates viewing party", :vcr do
      visit new_user_movie_party_path(@user_1, @movie_1.id)

      expect(@user_1.parties.count).to eq(0)
      expect(@user_2.parties.count).to eq(1)
      expect(@user_4.parties.count).to eq(0)

      fill_in("duration", with: 140)
      fill_in("[day(1i)]", with: 2023)
      fill_in("[day(2i)]", May)
      fill_in("[day(3i)]", 25)
      fill_in("[time(4i)]", with: 20)
      fill_in("[time(5i)]", with: 30)
      choose(@user_2.id)
      choose(@user_4.id)
      click_button("Create Party")
      expect(current_path).to eq("/users/#{@user_1.id}")

      expect(@user_1.parties.count).to eq(1)
      expect(@user_2.parties.count).to eq(2)
      expect(@user_4.parties.count).to eq(1)
    end

    xit "displays an error message if movie duration is longer than party duration" do
      visit new_user_movie_party_path(@user_1, @movie_1.id)

      fill_in("Duration of Party", with: 30)
      fill_in("Day", "05/11/2023")
      fill_in("Start Time", with: "20:00")
      choose(@user_2.id)
      choose(@user_4.id)
      click_button("Create Party")

      expect(current_path).to eq(new_user_movie_party_path(@user_1, @movie_1.id))
      expect(page).to have_content("Viewing Party must be longer than movie duration.")
    end

    xit "displays an error message if fields are blank" do
      visit new_user_movie_party_path(@user_1, @movie_1.id)

      fill_in("Day", "05/11/2023")
      fill_in("Start Time", with: "20:00")
      choose(@user_2.id)
      choose(@user_4.id)
      click_button("Create Party")

      expect(current_path).to eq(new_user_movie_party_path(@user_1, @movie_1.id))
      expect(page).to have_content("All fields must be filled in.")
    end
  end
end