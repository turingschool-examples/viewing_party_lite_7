require 'rails_helper'

RSpec.describe 'User Page' do
  before :each do 
    @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
    @viewing_party1 = ViewingParty.create!(duration: 3, party_date: Date.today, start_time: Time.now)
    @viewing_party2 = ViewingParty.create!(duration: 4, party_date: Date.today, start_time: Time.now)
    @viewing_party3 = ViewingParty.create!(duration: 6, party_date: Date.today, start_time: Time.now)
  end

  it 'page has user name on top, has a button to Discover Movies, a section that lists viewing parties' do 
    visit(user_path(@user1))

    expect(page).to have_content("#{@user1.name}'s Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Viewing Parties")

    within("#viewing_party-#{@viewing_party1.id}") do 
      expect(page).to have_content(@viewing_party1.duration)
      expect(page).to have_content(@viewing_party1.party_date)
      expect(page).to have_content(@viewing_party1.start_time.strftime('%H:%M'))
    end

    within("#viewing_party-#{@viewing_party2.id}") do 
      expect(page).to have_content(@viewing_party2.duration)
      expect(page).to have_content(@viewing_party2.party_date)
      expect(page).to have_content(@viewing_party2.start_time.strftime('%H:%M'))
    end

    within("#viewing_party-#{@viewing_party3.id}") do 
      expect(page).to have_content(@viewing_party3.duration)
      expect(page).to have_content(@viewing_party3.party_date)
      expect(page).to have_content(@viewing_party3.start_time.strftime('%H:%M'))
    end
  end

  it 'has a button to discover movies that when clicked, takes user to user discover page' do 
    visit(user_path(@user1))

    click_link("Discover Movies")
    expect(current_path).to eq(user_discover_index_path(@user1))
  end
end