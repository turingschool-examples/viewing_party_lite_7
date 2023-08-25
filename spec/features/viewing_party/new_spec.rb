require "rails_helper"

RSpec.describe "New Viewing Party Page", :vcr do
  before do
    @ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
    @movie = MoviesService.new.find_movie(234)
    visit new_user_movie_viewing_party_path(ally, movie.id)
  end

  it "has fields: duration, date, start time, checkboxes to invite users, and a submit button" do

  end

  it "defaults to movie runtime for duration" do

  end

  it "cannot be set with a duration less than movie runtime" do

  end

  it "cannot be set to a date earlier than current date" do

  end

  it "cannot be set to a time earlier than current time" do

  end

  it "will show this party on the dashboard pages of invited users" do

  end
end