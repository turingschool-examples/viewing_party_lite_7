# frozen_string_literal: true

require 'rails_helper'

describe 'user dashboard', :vcr do
  before :each do
    @user1 = User.create!(name: 'JoJo', email: 'JoJo@hotmail.com')
    @user2 = User.create!(name: 'JaJa', email: 'JaJa@hotmail.com')
    @user3 = User.create!(name: 'Donald J Trump', email: 'Trumpinator420@hotmail.com')
    @movie1 = SearchFacade.new({ id: "238" }).movies
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

  it 'has viewing party on user page' do
    visit new_user_movie_viewing_party_path(@user1, @movie1.id)

    fill_in('Duration', with: 176)
    select "2024", from: '[date(1i)]'
    select "May", from: '[date(2i)]'
    select "5", from: '[date(3i)]'
    select "00", from: '[time(4i)]'
    select "00", from: '[time(5i)]'
    within "#user_#{@user3.id}" do
      check
    end
    click_on "Create Party"

    within "#hosted" do
      expect(page).to have_content("#{@movie1.title} Viewing Party")
    end
  end

  it 'has viewing party on invitee page' do
    visit new_user_movie_viewing_party_path(@user1, @movie1.id)

    fill_in('Duration', with: 176)
    select "2024", from: '[date(1i)]'
    select "May", from: '[date(2i)]'
    select "5", from: '[date(3i)]'
    select "00", from: '[time(4i)]'
    select "00", from: '[time(5i)]'
    within "#user_#{@user3.id}" do
      check
    end
    click_on "Create Party"

    visit user_path(@user3)

    within "#invited" do
      expect(page).to have_content("#{@movie1.title} Viewing Party")
    end

    visit user_path(@user2)

    within "#invited" do
      expect(page).to have_no_content("#{@movie1.title} Viewing Party")
    end
  end
end
