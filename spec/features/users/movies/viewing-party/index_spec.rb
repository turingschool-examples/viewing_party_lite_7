require 'rails_helper'

RSpec.describe 'Viewing Party Index Page' do 
  before(:each) do
    load_test_data
    specific_movie_response = File.read('spec/fixtures/specific_movie.json')
    starwars_response = File.read('spec/fixtures/starwars_collection.json')
    lotr_response = File.read('spec/fixtures/lotr_collection.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/11?api_key=#{Rails.application.credentials.tmdb[:key]}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.12'
        }
      )
      .to_return(status: 200, body: starwars_response, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/120?api_key=#{Rails.application.credentials.tmdb[:key]}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.12'
        }
      )
      .to_return(status: 200, body: lotr_response, headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/268?api_key=#{Rails.application.credentials.tmdb[:key]}")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v2.7.12'
        }
      )
      .to_return(status: 200, body: specific_movie_response, headers: {})
  end
  
  it 'sets accepted to true for a user who accepts an invite' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)
    visit user_viewing_parties_path(@user2)
    

    within(first('.viewing-party')) do
      click_on 'Accept Invite'
    end

    expect(UserParty.where(party_id: Party.last.id, user_id: @user2.id).first.accepted).to eq(true)
  end
end
