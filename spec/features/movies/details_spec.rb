# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Movie Details' do
  before :each do
    load_test_data
  end

  it 'has a header', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party')

    click_link 'Home'

    expect(page).to have_current_path('/')
  end

  it 'has a sub header', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#sub_header') do
      expect(page).to have_content('Arthur')
    end
  end

  it "has a button to the user's discover page", :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#buttons') do
      click_button('Discover Movies')
    end

    expect(page).to have_current_path(user_discover_path(@anne))
  end

  it 'has a button to create a view party for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#buttons') do
      click_button('Create Viewing Party for Arthur')
    end

    expect(page).to have_current_path(new_user_movie_viewing_party_path(@anne, @arthur[:movie_id]))
  end

  it 'shows the vote average for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#details') do
      expect(page).to have_content('Vote: 5.6')
    end
  end

  it 'shows the runtime for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#details') do
      expect(page).to have_content('Runtime: 1 hr 50 min')
    end
  end

  it 'shows the genres for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#details') do
      expect(page).to have_content('Genre(s): Comedy, Romance')
    end
  end

  it 'shows the summary for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#summary') do
      expect(page).to have_content('Summary')
      expect(page).to have_content('A drunken playboy stands to lose a wealthy inheritance')
      expect('Summary').to appear_before('A drunken playboy stands to lose a wealthy inheritance')
    end
  end

  it 'shows the first 10 cast members for the movie', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#cast') do
      expect(page).to have_content('Cast')
      expect(page).to have_content('Character')
      expect(page).to have_content('Actor')
      expect('Character').to appear_before('Actor')
      expect(page).to have_content('Arthur')
      expect(page).to have_content('Russell Brand')
      expect('Arthur').to appear_before('Russell Brand')
      expect(page).to have_content('Helen Mirren')
      expect('Russell Brand').to appear_before('Helen Mirren')
      expect(page).to have_content('Greta Gerwig')
      expect(page).to have_content('Jennifer Garner')
      expect(page).to have_content('Geraldine James')
      expect(page).to have_content('Luis Guzmán')
      expect(page).to have_content('Nick Nolte')
      expect(page).to have_content('Peter Van Wagner')
      expect(page).to have_content('Christina Jacquelyn Calph')
      expect(page).to have_content('Peter, Candy Store Manager')
      expect(page).to have_content('John Hodgman')
      expect('Arthur').to appear_before('Peter, Candy Store Manager')
      expect('Russell Brand').to appear_before('John Hodgman')
      expect('Russell Brand').to appear_before('Helen Mirren')
      expect(page).not_to have_content('Officer Kaplan')
      expect(page).not_to have_content('Murphy Guyer')
    end
  end

  it 'shows total reviews for the movie', :vcr do
    visit user_movie_path(@anne, @batman[:movie_id])

    within('#reviews') do
      expect(page).to have_content('7 Reviews')
    end
  end

  it 'can show that there are no reviews', :vcr do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#reviews') do
      expect(page).to have_content('0 Reviews')
    end
  end

  it 'shows reviews and their authors', :vcr do
    visit user_movie_path(@anne, @batman[:movie_id])

    within('#reviews') do
      expect(page).to have_content("This movie is so bad I couldn't even finish it. - Albert, 4/10")
      expect(page).to have_content("Yeah, it's good. - Jakeflix, 10/10")
      expect('John Chard').to appear_before('Rob')
    end
  end
end

# rubocop:enable Metrics/BlockLength
