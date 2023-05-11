require 'rails_helper'

RSpec.describe 'users dashboard show page', type: :feature do
  before(:all) do
    @user1 = create(:user)
    @user2 = create(:user)

    # @movie1 = MovieFacade.find_movie(550)
    # @party1 = create(:party, movie_id: 550)

    # @partygoer1 = create(:partygoer, user: @user1, party: @party1, host: true)
    # @partygoer2 = create(:partygoer, user: @user2, party: @party1)
  end

  it 'displays the user dashboard header' do
    visit user_path(@user1)

    expect(page).to have_content("#{@user1.user_name}'s Dashboard")
    expect(page).to_not have_content(@user2.user_name)
  end

  it 'has a button linking to the user discover page' do
    visit user_path(@user1)

    expect(page).to have_button('Discover Movies')

    click_button('Discover Movies')

    expect(current_path).to eq(user_discover_index_path(@user1))
  end

  # describe 'viewing party list' do
  # end
end
