require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do 
  before :each do
    @monet = User.create!(name: "Monet Xchange", email: "Monet_Xchange@hotmess.com")
    @bob = User.create!(name: "Bob the Dragqueen", email: "Bobthehoe@hotmess.com")
    @aquaria = User.create!(name: "Aquaria", email: "Aquariahoe@hotmess.com")
    @trixie = User.create!(name: "Trixie Mattel", email: "Trixie@hotmess.com")
    @katya = User.create!(name: "Katya Zamolodchikova", email: "Katya@hotmess.com")
    @movie = MovieFacade.get_movie_details(238)
  end

  it 'displays the movie title for party' do 
    visit new_user_movie_viewing_party_path(@trixie, @movie.id)
    
    expect(page).to have_content('Create a Movie Party for The Godfather')
  end

  it 'has a link back to the discover page' do 
    visit new_user_movie_viewing_party_path(@trixie, @movie.id)

    expect(page).to have_link('Discover')
  end

  it 'has a form to create a new party' do 
    visit new_user_movie_viewing_party_path(@trixie, @movie.id)
    
    expect(page).to have_field(:duration)
    expect(page).to have_field(:date)
    expect(page).to have_field(:start_time)
    expect(page).to have_button('Create Party')

    fill_in :duration, with: 180
    fill_in :date, with: '2023-09-01'
    fill_in :start_time, with: '12:00'

    click_button 'Create Party'
    expect(current_path).to eq(user_path(@trixie))
  end

  it 'displays a message if the party is too short' do
    visit new_user_movie_viewing_party_path(@trixie, @movie.id)

    fill_in :duration, with: 120
    fill_in :date, with: '2023-09-01'
    fill_in :start_time, with: '12:00'

    click_button 'Create Party'
    expect(current_path).to eq(new_user_movie_viewing_party_path(@trixie, @movie.id))
    expect(page).to have_content("Please, you gonna cut this party short?")
  end

end