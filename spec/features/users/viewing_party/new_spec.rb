require 'rails_helper'

RSpec.describe "User's Viewing Party page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    @user2 = User.create!(name: 'Emily Jones', email: '343ftl.com')
    @user3 = User.create!(name: 'Jimmy johnson', email: 'jj33@aol.com')
    @user4 = User.create!(name: 'Todd Guy', email: 'tg@gmail.com')
    
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
    expect(page).to have_field('duration', with: "2h 55m") ##change to minutes 
  end

  it 'has a field for party date' do
    expect(page).to have_field('date')
  end
  
  it 'has a field for party start time' do
    expect(page).to have_field('start_time')
  end
  
  it 'has checkboxes for all other existing users' do
    expect(page).to have_field('selected_users[]', with: @user2.id)
    expect(page).to have_field('selected_users[]', with: @user3.id)
    expect(page).to have_field('selected_users[]', with: @user4.id)
    expect(page).to_not have_field('selected_users[]', with: @user1.id)
  end
  
  it 'has a button to create a party' do 
    expect(page).to have_button('Create Party')
  end
  
  it 'redirects the user back to dashboard when Party is created' do 
    fill_in 'duration', with: 210
    fill_in 'date', with: "2024-01-01"
    fill_in 'start_time', with: "07:00"
    check("selected_users[]", option: @user2.id)
    check("selected_users[]", option: @user3.id)
    click_button('Create Party')

    expect(current_path).to eq(user_path(@user1))
  end
  
  it 'displays new event on users dashboard' do 
    
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