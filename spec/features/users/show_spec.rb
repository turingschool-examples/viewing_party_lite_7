require 'rails_helper'

RSpec.describe 'User Page' do
  it 'page has a button to Discover Movies, a section that lists viewing parties' do 
    @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
    @viewing_party1 = ViewingParty.create!(duration: 3, party_date: Date.today, start_time: Time.now)
    @viewing_party2 = ViewingParty.create!(duration: 4, party_date: Date.today, start_time: Time.now)
    @viewing_party3 = ViewingParty.create!(duration: 6, party_date: Date.today, start_time: Time.now)

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
end