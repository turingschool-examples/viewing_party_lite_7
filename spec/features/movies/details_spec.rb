# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature "Movie Details" do
  before :each do
    load_test_data
  end

  it 'has a header' do
    # require 'pry';binding.pry
    visit user_movie_path(@anne, @arthur[:movie_id])

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")

    click_link "Home"

    expect(page).to have_current_path("/")
  end

  it 'has a sub header' do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#sub_header') do
      expect(page).to have_content('Arthur')
    end
  end

  it "has a button to the user's discover page" do
    visit user_movie_path(@anne, @arthur[:movie_id])

    within('#buttons') do
      click_button('Discover Page')
    end

    expect(page).to have_current_path(user_discover_path(@anne))
  end
end

# rubocop:enable Metrics/BlockLength
