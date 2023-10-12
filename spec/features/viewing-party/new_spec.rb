require 'rails_helper'

RSpec.describe "Viewing Party New page", type: :feature do
  describe "when I visit the viewing party new page" do
    before(:each) do
      @user_1 = User.create!(name: "Kiwi", email: "kiwibird@gmail.com")
      @user_2 = User.create!(name: "Chicken", email: "chickenbird@gmail.com")
      @user_3 = User.create!(name: "Coco", email: "cocobird@gmail.com")
      @user_4 = User.create!(name: "Hiccup", email: "hiccupbird@gmail.com")
      @movie_id = 926393

      visit new_user_movie_viewing_party(@user_1.id, @movie_id)
    end

    it "I should see the name of the movie title" do
      expect(page).to have_content("The Equalizer 3")
    end

    it "I should see a form below the movie title with the duration, when, start time, and checkboxes for each existing system user" do
      page.has_field? "duration"
      page.has_field? "date"
      page.has_field? "start_time"
      page.has_unchecked_field? @user_2.id
      page.has_unchecked_field? @user_3.id
      page.has_unchecked_field? @user_4.id
    end

    it "The duration should default the value of the movie runtime in minutes" do
      expect(page).to have_field("duration", with: 109)
    end

    xit "Should throw an error if the duration is less than the runtime of the movie" do

    end
  end
end