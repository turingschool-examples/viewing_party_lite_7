require 'rails_helper'

RSpec.describe 'new user movie party page', type: :feature do
  before :each do
    movie_details = {
      id: 238,
      vote_average: 8.200,
      original_title: "Howl's Moving Castle",
      runtime: 119,
      genres: 'animation',
      overview: 'When an unconfident young woman is cursed with an old body by a spiteful witch',
      name: 'Takuya Kimura',
      character: 'Howl',
      total_results: 5,
      author: 'randoms',
      content: 'good stuff'
    }
    @user1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
    @user2 = User.create!(name: 'Mama', email: 'mama@gmail.com')
    @movie1 = Movie.new(movie_details)
  end

  it 'lists the current movie title' do
    visit new_user_movie_party_path(@user1, @movie1)
    expect(page).to have_content(@movie1.title)
  end

  it 'has a form to create a new party, duration defaulting to movie runtime' do
    visit new_user_movie_party_path(@user1, @movie1)
    expect(page).to have_field(:duration, with: @movie1.runtime)
    expect(page).to have_field(:start_time)
    expect(page).to have_field(:date)
    expect(page).to have_unchecked_field "#{@user1.name}"
    expect(page).to have_button('Create Party')
  end

  context 'when filled out with valid data' do
    it 'form submission creates a new party and redirects back to discover page' do
      visit new_user_movie_party_path(@user1, @movie1)
      fill_in :duration, with: 120
      fill_in :start_time, with: '12:00'
      check "#{@user1.name}"
      click_button 'Create Party'
      expect(current_path).to eq(user_path(@user1))
      expect(page).to have_content('Duration: 120mins')
    end
  end

  context 'when filled out with invalid data' do
    # it 'form submission pushes a flash error and redirects back (blank field)' do
    #   visit new_user_movie_party_path(@user1, @movie1)
    #   fill_in :duration, with: 120
    #   fill_in :start_time, with: ''
    #   check :current_user
    #   click_button 'Create Party'
    #   expect(current_path).to eq(new_user_movie_party_path(@user1, @movie1))
    #   expect(page).to have_content('start time must not be left blank')
    # end

    it 'form submission pushes a flash error and redirects back (invalid duration)' do
      visit new_user_movie_party_path(@user1, @movie1)
      fill_in :duration, with: 90
      fill_in :start_time, with: '12:00'
      check "#{@user1.name}"
      click_button 'Create Party'
      expect(current_path).to eq(new_user_movie_party_path(@user1, @movie1))
      expect(page).to have_content('invalid duration')
    end
  end
end
