# frozen_string_literal: true

require 'rails_helper'

describe 'user dashboard' do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    @viewing_party1 = @user1.viewing_parties.create!(duration: 120, date: '12/12/2023',
                                                     time: '2023-12-12 13:00:00 UTC', movie_id: 1)
    @viewing_party2 = @user1.viewing_parties.create!(duration: 120, date: '13/12/2023',
                                                     time: '2023-13-12 13:00:00 UTC', movie_id: 2)
    @viewing_party3 = @user2.viewing_parties.create!(duration: 120, date: '06/01/2023',
                                                     time: '2023-01-06 13:00:00 UTC', movie_id: 3)

    visit user_path(@user1)
  end

  it 'has application title' do
    expect(page).to have_content('Viewing Party')
  end

  it 'has user name dashboard title' do
    expect(page).to have_content("#{@user1.name} Dashboard")
  end

  describe 'discover movies' do
    it 'has a discover movies button' do
      expect(page).to have_button('Discover Movies')
    end

    it 'clicking button redirects to users/:id/discover page' do
      visit user_path(@user2)

      click_button('Discover Movies')
      expect(current_path).to eq("/users/#{@user2.id}/discover")
    end
  end

  it 'has a veiwing parties section' do
    within '#viewing_parties' do
      expect(page).to have_content("Viewing Party #{@viewing_party1.id}")
      expect(page).to have_content("Viewing Party #{@viewing_party2.id}")
      expect(page).to have_no_content("Viewing Party #{@viewing_party3.id}")
    end
  end
end
