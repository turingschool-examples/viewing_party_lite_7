require 'rails_helper'

RSpec.describe "Movies Show page", type: :feature do
  describe "When I visit the movies show page" do
    before(:each) do
      @user = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")
      @movie_id = 926393

      visit user_movie_path(@user.id, @movie_id)
    end

    it "I see the following movie details: title, vote average, runtime, genres, summary" do
      expect(page).to have_content("The Equalizer 3")
      expect(page).to have_content("Average Vote: ")
      expect(page).to have_content("Runtime: 1h 49m")
      expect(page).to have_content("Genres: ")
      expect(page).to have_content("Summary: ")
    end

    it "I see the first 10 cast members as well as their characters listed" do
      
    end

    it "I see the total number of reviews as well as all reviews and their authors" do

    end
  end
end