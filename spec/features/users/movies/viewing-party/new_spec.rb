require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do 
  before(:each) do
    load_test_data
  end

  it 'When I visit the new viewing party page it contains movie title, duration of party, when date, start time, checkboxes next to each user' do
    specific_movie_response = File.read('spec/fixtures/specific_movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/268?api_key=#{Rails.application.credentials.tmdb[:key]}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: specific_movie_response, headers: {})

    visit "/users/#{@user1.id}/movies/268/viewing-party/new"
    expect(page).to have_field(:duration, with:126)
    expect(page).to have_field(:date)
    expect(page).to have_field(:start_time)
    expect(page).to have_button('Create Party')
    expect(page).to have_content('Batman')

    expect(@user2.user_parties.count).to eq(3)
    expect(@user3.user_parties.count).to eq(2)

    fill_in :duration, with: 180
    fill_in :start_time, with: '10:00'
    fill_in :date, with: '2023/08/01'
    check "#{@user2.name} (#{@user2.email})"
    check "#{@user3.name} (#{@user3.email})"
    click_button 'Create Party'

    expect(current_path).to eq(user_path(@user1.id))
    # save_and_open_page
    # expect(page).to have_content('Batman')

    # expect(@user2.user_parties.count).to eq(4)
    # expect(@user3.user_parties.count).to eq(3)
  end
end