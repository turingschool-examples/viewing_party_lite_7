require 'rails_helper'

RSpec.describe 'User dashboard' do
  before do
    @ally = User.create!(name: 'Ally Jean', email: 'allyjean@example.com')
    visit user_path(@ally)
  end

  it 'has a heading' do
    expect(page).to have_content("Ally Jean's Dashboard")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
  end
end

# As a user,
# When I visit a user dashboard,
# I should see the viewing parties that the user has been invited to with the following details:

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  who is hosting the event
#  list of users invited, with my name in bold
# I should also see the viewing parties that the user has created with the following details:

#  Movie Image
#  Movie Title, which links to the movie show page
#  Date and Time of Event
#  That I am the host of the party
#  List of friends invited to the viewing party

describe 'User show page - parties', :vcr do
  before :each do
    load_test_data
  end
  it 'displays a list of parties the user is invited to' do
    movie = MoviesService.new.find_movie(13)
    visit user_path(@user1)
    expect(page).to have_content('My Parties')
    expect(page).to have_content("Parties I'm Invited To")
    within('#invited-parties') do
      expect(page).to have_selector('img')
      expect(page).to have_content(movie.title)
      expect(page).to have_content(@party1.party_date)
      expect(page).to have_content(@party1.start_time.strftime('%I:%M %p'))
      within('table') do
        # looking for the host name in the table
        within('tbody tr:first-child td:nth-child(5)') do
          expect(page).to have_content(@user1.name)
        end
        # looking for the invited guests in the table
        within('tbody tr:first-child td:nth-child(6)') do
          expect(page).to have_content(@user1.name)
          expect(page).to have_content(@user2.name)
          expect(page).to have_content(@user3.name)
        end
      end
    end
  end

  it 'displays a list of parties the user is hosting' do
    VCR.use_cassette('search_results', record: :new_episodes) do
      movie = MoviesService.new.find_movie(155)
      visit user_path(@user1)
      expect(page).to have_content('My Parties')
      expect(page).to have_content("Parties I'm Hosting")
      within('#hosted-parties') do
        expect(page).to have_selector('img')
        expect(page).to have_content(movie.title)
        expect(page).to have_content(@party2.party_date)
        expect(page).to have_content(@party2.start_time.strftime('%I:%M %p'))
        within('table') do
          # looking for the host name in the table
          within('tbody tr:first-child td:nth-child(5)') do
            expect(page).to have_content(@user3.name)
          end
          # looking for the invited guests in the table
          within('tbody tr:first-child td:nth-child(6)') do
            expect(page).to have_content(@user3.name)
            expect(page).to have_content(@user1.name)
            expect(page).to have_content(@user2.name)
          end
        end
      end
    end
  end

  it 'has a link to the movie show page' do
    VCR.use_cassette('search_results', record: :new_episodes) do
      movie = MoviesService.new.find_movie(13)
      visit user_path(@user1)
      expect(page).to have_link(movie.title)
      click_link movie.title
      expect(current_path).to eq(user_movie_show_path(@user1, movie.id))
    end
  end
end
