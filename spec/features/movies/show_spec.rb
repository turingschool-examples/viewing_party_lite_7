require 'rails_helper'

RSpec.describe 'Movie Details Page' do 
  it 'exists', :vcr do 
    user = User.create!({ name: "Karl", email: "lokis_email@gmail.com" })
    visit "/users/#{user.id}/movies/872585"

    expect(page).to have_content('Viewing Party')
    expect(page).to have_link('Home')
    expect(page).to have_button('Discover Page')
    expect(page).to have_button('Create Viewing Party for Oppenheimer')
  end

  it 'has movie details for a particular movie', :vcr do 
    user = User.last
    visit "/users/#{user.id}/movies/872585"

    within '#movie_info' do 
      expect(page).to have_content('Vote: 8.2')
      expect(page).to have_content('Runtime: 3hr 2min')
      expect(page).to have_content('Drama')
      expect(page).to have_content('History')
      expect(page).to have_content('morally conflicted about the nature of his creation')
    end
  end

  it 'displays 10 cast members and their roles', :vcr do 
    user = User.last
    visit "/users/#{user.id}/movies/872585"

    with '#cast' do 
      expect(page).to have_content('Cillian Murphy as J. Robert Oppenheimer')
      expect(page).to have_content('Emily Blunt as Kitty Oppenheimer')
      expect(page).to have_content('Matt Damon as Leslie Groves')
      expect(page).to have_content('Robert Downey Jr. as Lewis Strauss')
    end
  end

  it 'displays the number of reviews and reviews with authors', :vcr do 
    user = User.last
    visit "/users/#{user.id}/movies/872585"

    with '#reviews' do 
      expect(page).to have_content('14 Reviews')
      expect(page).to have_content('Per Gunnar Jonsson')
      expect(page).to have_content('US feared penetration by communism')
    end
  end
end