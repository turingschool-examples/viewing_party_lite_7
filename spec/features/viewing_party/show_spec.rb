require 'rails_helper'

RSpec.describe 'Viewing Party Page', type: :feature do
  describe "viewing party details", :vcr do
    before(:each) do
      @user = User.create!(name: 'Morgan', email: 'morgan@email.com')
    end

    describe 'when I visit /users/:user_id/movies/:movies_id/viewing_party/new' do
      it 'shows the title of the movie' do
        json_response = File.read('spec/fixtures/spirited_away.json')
        parsed = JSON.parse(json_response, symbolize_names: true)
        movie_id = parsed[:id]
        stub_request(:get, "https://api.themoviedb.org/3/movie/129?api_key=#{Rails.application.credentials.tmdb[:key]}&language=en-US").
          with(
            headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})

        visit new_user_movie_viewing_party_path(@user, movie_id)

        expect(page).to have_content('Create a Movie Party for Spirited Away')
      end

      it 'shows viewing party details, including movie title, duration of party, day and start time' do
        json_response = File.read('spec/fixtures/spirited_away.json')
        parsed = JSON.parse(json_response, symbolize_names: true)
        movie_id = parsed[:id]
        stub_request(:get, "https://api.themoviedb.org/3/movie/129?api_key=#{Rails.application.credentials.tmdb[:key]}&language=en-US").
          with(
            headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})

        visit new_user_movie_viewing_party_path(@user, movie_id)

        expect(page).to have_content('Viewing Party Details')
        expect(page).to have_content('Movie Title')
        expect(page).to have_content('Spirited Away')
        expect(page).to have_content('Duration of Party')
        expect(page).to have_content('Start Date')
        expect(page).to have_content('Start Time')
        expect(page).to have_field('duration_of_party', with: 125)
      end

      it 'creates a new viewing party' do
        user1 = User.create!(name: 'Sam', email: 'sam@email.com')
        user2 = User.create!(name: 'Susan', email: 'susan@email.com')
        json_response = File.read('spec/fixtures/spirited_away.json')
        parsed = JSON.parse(json_response, symbolize_names: true)
        movie_id = parsed[:id]
        stub_request(:get, "https://api.themoviedb.org/3/movie/129?api_key=#{Rails.application.credentials.tmdb[:key]}&language=en-US").
          with(
            headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
            }).
          to_return(status: 200, body: json_response, headers: {})

        visit new_user_movie_viewing_party_path(@user, movie_id)

        fill_in('party_date', with: '2023-12-01')
        fill_in('start_time', with: '07:00')

        within("#user-#{user1.id}") do
          check("invites[]")
        end

        within("#user-#{user2.id}") do
          check("invites[]")
        end

        click_button('Create Party')

        expect(current_path).to eq(user_path(@user))
        expect(page).to have_content('Movie Title: Spirited Away')
        expect(page).to have_content('Duration: 125 minutes')
        expect(page).to have_content('Date: Dec 01, 2023')
        expect(page).to have_content('Start Time: 07:00 AM')
        expect(page).to have_content('Host: Morgan')
        expect(page).to have_content('Guest List: Sam, Susan')
      end
    end
  end
end
