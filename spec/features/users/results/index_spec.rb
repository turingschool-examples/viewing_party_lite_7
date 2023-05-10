# frozen_string_literal: true

require 'rails_helper'

describe 'user results page', :vcr do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    @viewing_party1 = @user1.viewing_parties.create!(duration: 120, date: '12/12/2023',
                                                     time: '2023-12-12 13:00:00 UTC', movie_id: 1)
    @viewing_party2 = @user1.viewing_parties.create!(duration: 120, date: '13/12/2023',
                                                     time: '2023-13-12 13:00:00 UTC', movie_id: 2)
    @viewing_party3 = @user2.viewing_parties.create!(duration: 120, date: '06/01/2023',
                                                     time: '2023-01-06 13:00:00 UTC', movie_id: 3)
    visit user_discover_path(@user1)
  end
  
  it 'has Top Rated Movies results', :vcr do
    @movie1 = SearchFacade.new({type: "top_rated"}).movies.first
    expect(page).to have_button('Top Rated Movies')
    click_button('Top Rated Movies')
    expect(current_path).to eq(user_movies_path(@user1))
    within("#movie-#{@movie1.id}") do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.vote_average)
    end
  end

  it 'has returnt to discover page button' do
    click_button('Top Rated Movies')
    expect(page).to have_button("Return to Discover")
    click_on("Return to Discover")
    expect(current_path).to eq(user_discover_path(@user1))
  end
end