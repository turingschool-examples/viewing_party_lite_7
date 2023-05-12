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
      expect(page).to have_selector("input##{@user_1.id}[type='radio']")
      expect(page).to have_selector("input##{@user_2.id}[type='radio']")
      expect(page).to have_selector("input##{@user_3.id}[type='radio']")
      expect(page).to have_selector("input##{@user_4.id}[type='radio']")
      expect(page).to have_selector("input##{@user_5.id}[type='radio']")
      expect(page).to have_button("Create Party")
    end
  end

  describe "function" do
    before do 
      test_data
      test_movie_details
      @movie_1 = Movie.new(@data)
    end

    xit "creates viewing party", :vcr do
      visit new_user_movie_party_path(@user_1, @movie_1.id)

      expect(@user_1.parties.count).to eq(0)
      expect(@user_2.parties.count).to eq(1)
      expect(@user_4.parties.count).to eq(0)

      fill_in("Duration of Party", with: 140)
      fill_in("Day", "05/11/2023")
      fill_in("Start Time", with: "20:00")
      choose(@user_2.id)
      choose(@user_4.id)
      click_button("Create Party")
      expect(current_path).to eq("/users/#{@user_1.id}")

      expect(@user_1.parties.count).to eq(1)
      expect(@user_2.parties.count).to eq(2)
      expect(@user_4.parties.count).to eq(1)
    end
  end
end