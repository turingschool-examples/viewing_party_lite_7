require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @user_3 = create(:user)
    @user_4 = create(:user)

    top_20_response = File.read('spec/fixtures/top_movies.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: top_20_response)

    search_results = File.read('spec/fixtures/godfather_search.json')
    stub_request(:get, "https://api.themoviedb.org/3/search/movie?query=Godfather&api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: search_results)

    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_DB_KEY']}&query=")
      .to_return(status: 200, body: '{"results": []}')
    
    movie_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: movie_response)

    actor_response = File.read('spec/fixtures/actors.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: actor_response)

    review_response = File.read('spec/fixtures/reviews.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: review_response)

    json_response = File.read('spec/fixtures/movie.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['MOVIE_DB_KEY']}")
      .to_return(status: 200, body: json_response, headers: {})

    @movie = Movie.new(JSON.parse(json_response, symbolize_names: true))

    visit '/'

    click_on "Log In"

    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password

    click_button("Log In")
  end

  it 'displays the movie title' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing_parties/new"

    expect(page).to have_content("#{@movie.title}")
  end

  it 'has a form to create a new viewing party' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing_parties/new"

    expect(page).to have_content("Duration of Party")
    expect(page).to have_content("Date of Party")
    expect(page).to have_content("Time of Party")
    expect(page).to have_content("Invite Friends")
    expect(page).to have_field :duration, with: @movie.runtime
    expect(page).to have_field :party_date
    expect(page).to have_field :party_time
    expect(page).to have_unchecked_field(@user_2.name)
    expect(page).to have_unchecked_field(@user_3.name)
    expect(page).to have_unchecked_field(@user_4.name)
  end

  it 'creates a new viewing party when the form is filled out' do
    visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing_parties/new"

    within "#new_viewing_party" do
      fill_in :duration, with: 240
      fill_in :party_date, with: Date.today
      fill_in :party_time, with: Time.now + 1.hours

      check(@user_2.name)
      check(@user_3.name)

      click_button "Create Party"

    end

    expect(current_path).to eq("/users/#{@user_1.id}")
  end

  it 'does not create a new viewing party when the user is not logged in' do
    visit '/'

    click_on "Log Out"

    visit "/users/#{@user_1.id}/movies/#{@movie.id}/viewing_parties/new"
    
    expect(page).to have_content("You must be logged in to create a viewing party")
  end
end