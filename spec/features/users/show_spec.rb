# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'User show' do
  it 'has a index header', :vcr do
    load_test_data

    visit user_path(@anne)

    expect(page).to have_link('Home')
    expect(page).to have_content('Viewing Party')

    click_link 'Home'

    expect(page).to have_current_path('/')
  end

  it 'has a sub header', :vcr do
    load_test_data

    visit user_path(@anne)

    expect(page).to have_content("#{@anne.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')

    click_button 'Discover Movies'

    expect(page).to have_current_path(user_discover_path(@anne))
  end

  it 'shows viewing parties', :vcr do
    load_test_data

    visit user_path(@anne)

    expect(find("#party-#{@arthur.id}")).to have_link('Arthur')
    expect(find("#party-#{@arthur.id}")).to have_content(@arthur.date_formatter(@arthur.date_time))
    expect(find("#party-#{@arthur.id}")).to have_content('140 min')
    expect(find("#party-#{@arthur.id}")).to have_content(@arthur.date_formatter(@arthur.date_time))
    expect(find("#party-#{@arthur.id}")).to have_content('Hosting')

    expect(find("#party-#{@candyman.id}")).to have_content('Invited')
  end

  it 'movie title can take you to movie show page', :vcr do
    load_test_data

    visit user_path(@anne)

    expect(find("#party-#{@arthur.id}")).to have_link('Arthur')

    click_link 'Arthur'

    expect(page).to have_current_path("/users/#{@anne.id}/movies/#{@arthur.movie_id}")
  end

  it 'shows hosts is host', :vcr do
    load_test_data

    visit user_path(@anne)

    within("#party-#{@candyman.id}") do
      expect(find('#host')).to have_content('Blair Busch')
    end
  end

  it 'lists attendees', :vcr do
    load_test_data

    visit user_path(@anne)

    within("#party-#{@batman.id}") do
      expect(find('#attending')).to have_content('Anne Anderson')
      expect(find('#attending')).to have_content('Blair Busch')
      expect(find('#attending')).to_not have_content('Cindy')
    end
  end
end

# rubocop:enable Metrics/BlockLength
