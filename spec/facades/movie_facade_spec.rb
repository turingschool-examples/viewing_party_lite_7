require 'rails_helper'

describe MovieFacade do
  describe 'class methods' do
    before(:each) do
      @user = User.create(name: 'Joseph', email: 'jlee230@turing.edu', password: "test")
      @search_term = 'Die+Hard'
    end

    feature '#top_rated' do
      scenario 'Find Top Rated Movies button is clicked', :vcr do
        visit "/users/#{@user.id}/discover"

        expect(page).to have_button('Find Top Rated Movies')
        click_on('Find Top Rated Movies')

        expect(page.status_code).to eq(200)
        expect(page).to have_link('The Godfather')
        expect(page).to have_content('8.7')
      end
    end

    feature '#search' do
      scenario 'Search bar is filled in and search button is clicked', :vcr do
        visit "/users/#{@user.id}/discover"

        expect(page).to have_field(:search)
        expect(page).to have_button('Find Movies')
        fill_in(:search, with: 'Die Hard')
        click_on('Find Movies')

        expect(page.status_code).to eq(200)
        expect(page).to have_link('Die Hard')
        expect(page).to have_content('7.78')
      end
    end

    feature '#movie_details' do
      scenario 'the movie show page is loaded and a Movie PORO is created', :vcr do
        visit "/users/#{@user.id}/movies?search=#{@search_term}&commit=Find+Movies"

        expect(page).to have_link('Die Hard 2')
        click_on('Die Hard 2')

        expect(page.status_code).to eq(200)
        expect(page).to have_content('Title: Die Hard 2')
        expect(page).to have_content('Vote Average: 6.929')
        expect(page).to have_content('Runtime: 2 hours and 4 minutes')
        expect(page).to have_content('Genres:')
        expect(page).to have_content('Action')
        expect(page).to have_content('Thriller')
        expect(page).to have_content('Overview: Off-duty cop John McClane is gripped with a feeling of déjà vu when, on a snowy Christmas Eve in the nation’s capital, terrorists seize a major international airport, holding thousands of holiday travelers hostage. Renegade military commandos led by a murderous rogue officer plot to rescue a drug lord from justice and are prepared for every contingency except one: McClane’s smart-mouthed heroics.')
        expect(page).to have_content('Vote Count: 5360')
      end
    end

    feature '#cast' do
      scenario 'the movie show page is loaded and a Cast PORO is created', :vcr do
        visit "/users/#{@user.id}/movies?search=#{@search_term}&commit=Find+Movies"

        expect(page).to have_link('Die Hard 2')
        click_on('Die Hard 2')

        expect(page.status_code).to eq(200)
        expect(page).to have_content('Bruce Willis plays the character of "John McClane"')
        expect(page).to have_content('Bonnie Bedelia plays the character of "Holly McClane"')
        expect(page).to have_content('William Sadler plays the character of "Stuart"')
      end
    end

    feature '#reviews' do
      scenario 'the movie show page is loaded and a Review PORO is created', :vcr do
        visit "/users/#{@user.id}/movies?search=#{@search_term}&commit=Find+Movies"

        expect(page).to have_link('Die Hard 2')
        click_on('Die Hard 2')

        expect(page.status_code).to eq(200)
        expect(page).to have_content('Review Author: talisencrw')
        expect(page).to have_content('Review Text: Great fun re-watching this after checking out the original for the first time. One of the very best filmic franchises out there, to be sure.')
      end
    end
  end
end
