require 'rails_helper'

RSpec.describe 'User Page' do
  it '' do 
    @user1 = User.create(name: 'Joe', email: 'joeiscool@yahoo.com')
    @viewing_party1 = ViewingParty.create!(duration: 3, party_date: Date.today, start_time: Time.now)


    visit(user_path(@user1))


    expect(page).to have_content("#{@user1.name} Dashboard")
    expect(page).to have_button("Discover Movies")

    within('.viewing_parties') do 
      expect(page).to have_content()
    end
  end
end