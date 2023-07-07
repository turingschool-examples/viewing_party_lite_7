require 'rails_helper'

RSpec.describe 'Movie Show Page', :vcr do
  before :each do
    @user1 = User.create!(user_name: "Bob", email: "bob@gmail.com")
    @user2 = User.create!(user_name: "Kate", email: "kate@gmail.com")
  end
  it 'redirects and displays movie title and vote average after clicking Find Top Rated Movies' do
    
    visit "/users/#{@user1.id}/discover"

    click_button("Find Top Rated Movies")

    expect(current_path).to eq("/users/#{@user1.id}/movies?q=top%20rated")
    expect(page).to have_link("The Shawshank Redemption")
    expect(page).to have_content("Vote Average: #{Movie.first.vote_average}")

    click_link("The Shawshank Redemption")

    expect(current_path).to eq("/users/#{@user1.id}/movies/#{Movie.first.id}")
  end

  xit 'redirects and displays movie title and vote average after clicking Find Movies' do
    visit "/users/#{@user1.id}/discover"

    fill_in "Enter Movie Title", with: "The Matrix"

    click_button("Find Movies")

    expect(current_path).to eq("/users/#{@user1.id}/movies?q=The%20Matrix")
    expect(page).to have_link("The Matrix")
    expect(page).to have_content("Vote Average: #{Movie.first.vote_average}")

    click_link("The Matrix")

    expect(current_path).to eq("/users/#{@user1.id}/movies/#{Movie.first.id}")
  end
end