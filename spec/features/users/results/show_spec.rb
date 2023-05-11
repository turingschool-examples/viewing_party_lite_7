# frozen_string_literal: true

require 'rails_helper'

describe 'user result show page', :vcr do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    @viewing_party1 = @user1.viewing_parties.create!(duration: 120, date: '12/12/2023',
                                                     time: '2023-12-12 13:00:00 UTC', movie_id: 1)
    @viewing_party2 = @user1.viewing_parties.create!(duration: 120, date: '13/12/2023',
                                                     time: '2023-13-12 13:00:00 UTC', movie_id: 2)
    @viewing_party3 = @user2.viewing_parties.create!(duration: 120, date: '06/01/2023',
                                                     time: '2023-01-06 13:00:00 UTC', movie_id: 3)
    visit user_discover_index_path(@user1)
  end

  it 'has button to create a viewing party' do
  end

  it 'has a button to return to the discover page' do
  end

  it 'has a details button to view the viewing party page' do
  end

  describe 'movie information' do
    it 'has movie title' do
    end

    it 'has vote average of movie' do
    end

    it 'has runtime in hours and minutes' do
    end

    it 'has grenres for movie' do
    end

    it 'has a summary' do
    end

    it 'lists first 10 cast members' do
    end

    it 'has count of total reviews' do
    end

    it 'has each reviews author and info' do
    end

    it 'has a details section with 3 details' do
      #alternative titles
      #release date
      #translations
    end
  end
end


# When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
# I should see

# Button to create a viewing party
# Button to return to the Discover Page
# Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)

# And I should see the following information about the movie:

# Movie Title
# Vote Average of the movie
# Runtime in hours & minutes
# Genre(s) associated to movie
# Summary description
# List the first 10 cast members (characters&actress/actors)
# Count of total reviews
# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API