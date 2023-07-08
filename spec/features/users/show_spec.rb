require 'rails_helper'
#
RSpec.describe 'User Dashboard page' do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    @user2 = User.create!(name: 'Emily Jones', email: '343ftl.com')
    @user3 = User.create!(name: 'Jimmy johnson', email: 'jj33@aol.com')
    @user4 = User.create!(name: 'Todd Guy', email: 'tg@gmail.com')
  end
  
  it 'displays the users Dashboard' do
    visit user_path(@user1)
    
    within('#header') do
      expect(page).to have_content("#{@user1.name}'s Dashboard")
      expect(page).to_not have_content(@user2.name)
    end
  end

  it 'displays a list of viewing parties' do
    visit user_path(@user1)
    within('#viewing_party_list') do
      expect(page).to have_content("Viewing Parties")
    end
  end

  it 'displays a button to Discover Movies' do
    visit user_path(@user1)
    
    expect(page).to have_button('Discover Movies')
  end
  
  it 'redirects to the Discover Movies page when the Discover Movies button is clicked' do
    visit user_path(@user1)

    click_button('Discover Movies')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

    # Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
  # When: field to select date
  # Start Time: field to select time
  # Checkboxes next to each existing user in the system
  # Button to create a party
  # Details When the party is created, the user should be redirected back to the dashboard where the new event is shown. The event should also be listed on any other user's dashbaords that were also invited to the party.
  it 'displays new event on users dashboard' do 
    visit  user_viewing_party_path(@user1, 238)

    fill_in 'duration', with: 210
    fill_in 'date', with: "2024-01-01"
    fill_in 'start_time', with: "07:00"
    check("selected_users[]", option: @user2.id)
    check("selected_users[]", option: @user3.id)
    click_button('Create Party')

    expect(current_path).to eq(user_path(@user1))
    expect(page).to have_content("The Godfather")
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to_not have_content(@user4.name)
  end
  
  it 'displays events on other invited users dashboards' do
    visit user_viewing_party_path(@user1, 238)
    
    fill_in 'duration', with: 210
    fill_in 'date', with: "2024-01-01"
    fill_in 'start_time', with: "07:00"
    check("selected_users[]", option: @user2.id)
    check("selected_users[]", option: @user3.id)
    click_button('Create Party')

    visit user_path(@user2)
    expect(page).to have_content("The Godfather")
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
    expect(page).to_not have_content(@user4.name)
  end
end
