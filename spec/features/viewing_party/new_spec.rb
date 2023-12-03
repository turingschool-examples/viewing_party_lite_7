require 'rails_helper'

RSpec.describe 'Movie Results Page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Scott DeVoss', email: 'scottd@gmail.com')
    @user2 = User.create!(name: 'Cory Powell', email: 'coryp@yahoo.com')
    @user3 = User.create!(name: 'Tony the Tiger', email: 'tonyt@gmail.com')
    @user4 = User.create!(name: 'Santa the Claus', email: 'santabb@gmail.com')
  end

  describe "When I visit '/users/:user_id/movies/:movid_id/viewing_parties/new'" do
    it 'I should have the name of the movie title above a form' do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155/viewing_parties/new"

        expect(page).to have_content("\nCreate a Viewing Party for The Dark Knight")
      end
    end

    it 'I should see a form with fields to create a party with: Duration of Party, When, Start Time, 
    Checkboxes to each existing user, Button to create a party and when clicked should take you back to the dashboard' do
      VCR.use_cassette('batman_details') do
        visit "/users/#{@user1.id}/movies/155/viewing_parties/new"

        expect(page).to have_field(:duration)
        expect(page).to have_field(:when)
        expect(page).to have_field(:start_time)
        expect(page).to have_field(:start_time)
        expect(page).to have_content('Invite Other Users!')
        expect(page).to_not have_unchecked_field(@user1.name)
        expect(page).to have_unchecked_field(@user2.name)
        expect(page).to have_unchecked_field(@user3.name)
        expect(page).to have_unchecked_field(@user4.name)
        expect(page).to have_button('Create A Party')

        fill_in(:duration, with: '152')
        fill_in(:when, with: '2023-12-15')
        fill_in(:start_time, with: '12:00:00 UTC')
        check(@user2.name.to_s, allow_label_click: true)

        click_button('Create A Party')

        expect(current_path).to eq("/users/#{@user1.id}")
        expect(page).to have_content('When: 2023-12-15')
        expect(page).to have_content('Start Time: 12:00:00 UTC')
      end
    end

    xit 'The form should not allow you to make a party if the duration of the party is less than the
    length of the movie ' do
      VCR.use_cassette('batman_details') do
        #  a viewing party should NOT be created if set to a value less than the duration of the movie
      end
    end
  end
end
