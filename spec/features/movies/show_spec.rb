require "rails_helper"

RSpec.describe "Movie Details (Show) Page" do
  it "has buttons to create a viewing party or go back to discover" do
    ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
    movie = MoviesService.new.find_movie(234)
    visit user_movie_path(ally, movie)

    expect(page).to have_button("Create a Viewing Party")
    # Update later: test that button links to viewing party page 
    # (put in relevant viewing party spec)
    expect(page).to have_button("Back to Discover")
    click_button("Back to Discover")
    expect(current_path).to eq(user_discover_path(ally))
  end

  it "has all the movie's details" do
    ally = User.create!(name: "Ally Jean", email: "allyjean@example.com")
    movie = MoviesService.new.find_movie(234)
    visit user_movie_path(ally, movie)

    expect(page).to have_content(movie.title)
    expect(page).to have_content("Vote Average: #{movie.vote_average}")
    expect(page).to have_content(movie.formatted_runtime)
    movie.genres.each { |genre| expect(page).to have_content(genre)}
    expect(page).to have_content(movie.summary)
    expect(page).to have_content("Cast List")
    movie.cast.each_with_index do |cast_member, index| 
      within("#cast-#{index}") do
        expect(page).to have_content(cast_member.name)
        expect(page).to have_content(cast_member.character)
      end
    end
    expect(page).to have_content("Total Reviews: #{movie.total_reviews}")
    movie.reviews.each_with_index do |review, index|
      within("#review-#{index}") do
        expect(page).to have_content("Author: #{review[:author]}")
        expect(page).to have_content("Rating: #{review[:rating]}")
        expect(page).to have_content(review[:comments])
      end
    end
  end
end