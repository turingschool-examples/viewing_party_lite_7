require 'rails_helper'

RSpec.describe 'user movies page' do
  before(:each) do
    @user_1 = create(:user)
    @party1 = create(:viewing_party)
    @party2 = create(:viewing_party)
    create(:user_party, user: @user_1, viewing_party: @party1, host: false)
    create(:user_party, user: @user_1, viewing_party: @party2, host: true)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)
  end

  it 'displays the top rated movies' do
    visit "/users/#{@user_1.id}/movies"
    
    expect(page).to have_content('Top Rated Movies')
  end
end