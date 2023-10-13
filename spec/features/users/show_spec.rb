# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'User show' do
  #  before do
  #   WebMock.allow_net_connect!
  #   WebMock.disable!
  #   VCR.eject_cassette
  #   VCR.turn_off!(:ignore_cassettes => true)
  # end
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

    expect(find("#party-#{@arthur.id}")).to have_content('Arthur')
    expect(find("#party-#{@arthur.id}")).to have_content(@arthur.date_formatter(@arthur.date_time))
    expect(find("#party-#{@arthur.id}")).to have_content('140 min')
    expect(find("#party-#{@arthur.id}")).to have_content(@arthur.date_formatter(@arthur.date_time))
    expect(find("#party-#{@arthur.id}")).to have_content('Hosting')

    expect(find("#party-#{@candyman.id}")).to have_content('Invited')
  end
end

# rubocop:enable Metrics/BlockLength
