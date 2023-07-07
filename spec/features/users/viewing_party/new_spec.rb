require 'rails_helper'

RSpec.describe "User's Viewing Party page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    @user2 = User.create!(name: 'Emily Jones', email: '343ftl.com')
    @user3 = User.create!(name: 'Jimmy johnson', email: 'jj33@aol.com')
    @user4 = User.create!(name: 'Todd Guy', email: 'tg@gmail.com')
    
    @party1 = Party.create!(date: '2021-07-04', start_time: '17:00:00 UTC' , duration: 120, movie_id: 1, host_id: @user1.id)
    @party2 = Party.create!(date: '2021-12-09', start_time: '08:00:00 UTC' , duration: 150, movie_id: 2, host_id: @user2.id)
    
    @party_users1 = PartyUser.create!(user_id: @user1.id, party_id: @party1.id)
    @party_users2 = PartyUser.create!(user_id: @user3.id, party_id: @party1.id)
    @party_users3 = PartyUser.create!(user_id: @user2.id, party_id: @party1.id)
    @party_users4 = PartyUser.create!(user_id: @user2.id, party_id: @party2.id)
    @party_users5 = PartyUser.create!(user_id: @user4.id, party_id: @party2.id)
    
    visit  user_viewing_party_path(@user1, 238)
  end
 
  
  # Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
  # When: field to select date
  # Start Time: field to select time
  # Checkboxes next to each existing user in the system
  # Button to create a party
  # Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.
  it 'displays the movie title' do
    expect(page).to have_content('The Godfather')
  end

  it 'has a button to Discover Page' do
    expect(page).to have_button('Discover Page')
  end

  it 'has a field for party duration that defaults to movie runtime' do
    
  end

  it 'has a field for party date' do
    
  end
  
  it 'has a field for party start time' do
    
  end
  
  xit 'has checkboxes for existing users' do
    
  end
  
  xit 'has a button to create a party' do 
    
  end
  
  xit 'redirects the user back to dashboard when Party is created' do 
    
  end
  
  xit 'displays new event on users dashboard' do 
    
  end
  
  xit 'displays events on other invited users dashboards' do
    
  end
  
  xit 'does not create a party if duration is less than the movie runtime' do
  
  end

  xit 'does not create a party if any field is empty' do

  end

  xit 'does not create a party if no user is selected' do

  end
end