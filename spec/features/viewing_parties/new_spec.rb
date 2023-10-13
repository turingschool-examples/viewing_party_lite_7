# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Viewing Party New' do
  it 'displays form', :vcr do
    load_test_data

    visit "/users/#{@cindy.id}/movies/42470/viewing_parties/new"

    expect(page).to have_content('Create a Movie Party for The Day of the Dolphin')
    expect(page).to have_content('Viewing Party Details')
    expect(page).to have_content('Movie Title')
    expect(page).to have_content('Duration of Party')
    expect(page).to have_field(:duration)
    expect(page).to have_content('Day')
    expect(page).to have_select('_date_2i')
    expect(page).to have_content('Start time')
    expect(page).to have_select('_time_5i')
    expect(page).to have_content('Invite Other Users')
    expect(page).to have_content('Anne Anderson (anne.anderson@aol.com')
  end

  it 'creates viewing parties with attributes', :vcr do
    load_test_data

    visit "/users/#{@cindy.id}/movies/42470/viewing_parties/new"

    click_button 'Create Party'

    expect(page).to have_current_path(user_path(@cindy))

    expect(find('#movie-42470')).to have_content('The Day of the Dolphin')
    expect(find('#movie-42470')).to have_content('104 min')
    expect(find('#movie-42470')).to have_content('Hosting')
  end

  it 'creates viewing parties with others invited', :vcr do
    load_test_data

    visit user_path(@anne)

    expect(page).to_not have_content('The Day of the Dolphin')

    visit "/users/#{@cindy.id}/movies/42470/viewing_parties/new"

    find("#user-#{@anne.id}").check 'invites_id_'

    click_button 'Create Party'

    expect(page).to have_content('The Day of the Dolphin')
    expect(find('#movie-42470')).to have_content('Hosting')

    visit user_path(@anne)

    expect(page).to have_content('The Day of the Dolphin')
    expect(find('#movie-42470')).to have_content('Invited')

    visit user_path(@blair)

    expect(page).to_not have_content('The Day of the Dolphin')
  end

  it '(sad path) will return error is duration is blank', :vcr do
    load_test_data

    visit "/users/#{@cindy.id}/movies/42470/viewing_parties/new"

    fill_in :duration, with: nil

    click_button 'Create Party'

    expect(page).to have_content("Error: Duration can't be blank")
  end
end

# rubocop:enable Metrics/BlockLength
