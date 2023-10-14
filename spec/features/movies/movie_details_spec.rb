require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  before :each do
    @u1 = User.create!(name: 'Tim', email: 'tim@brayn10.com')
    @movie1 = Movie.new(title: 'Movie Title 1', vote_average: 9.5, runtime: 100, api_id: 1, genres: ['Action', 'Comedy'], summary: 'Summary description', id: 1)
  end

  it 'displays movie details by id and buttons' do
    # Visit the movie's detail page
    stub_request(:get, "https://api.themoviedb.org/3/movie/1?api_key=#{Rails.application.credentials.api_key}&movie_id=1").
    to_return(status: 200, body: File.read("spec/features/fixtures/movie_details.json"), headers: {})
    visit user_path(@u1)
    
    visit user_movie_path(user_id: @u1.id, id: @movie1.id) # Use 'id' instead of 'movie_id'

    # Assertions for movie details
    expect(page).to have_content('Movie Title: Santo')
    expect(page).to have_content('Vote Average: 6.114')
    expect(page).to have_content('Runtime: 95')
    # expect(page).to have_content('Genre(s)')
    expect(page).to have_content('Summary description: Innocent')
    # expect(page).to have_content('List of cast members')
    # expect(page).to have_content('Total Reviews')
    # expect(page).to have_content('Review Author')
    # expect(page).to have_content('Review Information')

    # Assertions for buttons
    # expect(page).to have_link('Create a Viewing Party', href: new_user_movie_viewing_party_path(user_id: @u1, id: @movie1.id)) # Use 'id' instead of 'movie_id'
    # expect(page).to have_link('Return to Discover Page', href: user_discover_index_path(user_id: @u1))
  end
end
