# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:each) do
    @user = User.create!(name: 'Bob', email: 'bob@bob.bob', password: 'bob')
    VCR.use_cassette(:movie_details, serialize_with: :json) do
      visit "/users/#{@user.id}/movies/238"
    end
  end
  
  describe 'As a visitor when I visit a movie show page' do
    describe 'I should see the movie details' do
      before(:each) do
        visit login_path
        
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_on 'Log In'
        
        VCR.use_cassette(:movie_details, serialize_with: :json) do
          visit "/users/#{@user.id}/movies/238"
        end
      end
      it 'should have a title, runtime, vote_average, genres, and summary' do

        expect(page).to have_content('The Godfather')
        expect(page).to have_content('2h 55m')
        expect(page).to have_content('8.7')
        expect(page).to have_content('Drama')
        expect(page).to have_content('Crime')
        expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family')
      end

      it 'should have a list of cast members' do
        expect(page).to have_content('Marlon Brando')
        expect(page).to have_content('Al Pacino')
        expect(page).to have_css('.cast_member', count: 10)
      end
    end

    describe 'I should see buttons to create a viewing party and to return to the Discover page' do
      it 'should have a button that takes me to a form to create a new viewing party' do       
        VCR.use_cassette(:viewing_party_new, serialize_with: :json) do
          visit login_path
          
          fill_in :email, with: @user.email
          fill_in :password, with: @user.password
          click_on 'Log In'
          
          visit "/users/#{@user.id}/movies/238"
          
          click_button 'Create A Viewing Party for The Godfather'

          expect(current_path).to eq("/users/#{@user.id}/movies/238/viewing-party/new")
        end
      end

      it 'if I click the button without being logged in, I cannot create a new viewing party' do       
        VCR.use_cassette(:viewing_party_new, serialize_with: :json) do
          visit "/users/#{@user.id}/movies/238"
        
          click_button 'Create A Viewing Party for The Godfather'
        
          expect(current_path).to eq("/users/#{@user.id}/movies/238")
          expect(page).to have_content('You must be logged in or registered to access this page')
        end
      end

      it 'should have a button that takes me back to the discover page' do
        VCR.use_cassette(:viewing_party_new, serialize_with: :json) do
          visit login_path
          
          fill_in :email, with: @user.email
          fill_in :password, with: @user.password
          click_on 'Log In'
          
          visit "/users/#{@user.id}/movies/238"
          
          click_button 'Discover Page'

          expect(current_path).to eq(user_discover_path(@user))
        end
      end
    end
  end
end
