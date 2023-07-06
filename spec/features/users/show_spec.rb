require 'rails_helper'
#
RSpec.describe 'User Dashboard page' do
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
  
  # As a user,
  # When I go to a user dashbaord,
  # and click "Discover Movies" button,
  # I am redirected to a discover page '/users/:id/discover', where :id is the user id of the user who's dashboard I was just on.
  
  it 'redirects to the Discover Movies page when the Discover Movies button is clicked' do
    visit user_path(@user1)

    click_button('Discover Movies')
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

end