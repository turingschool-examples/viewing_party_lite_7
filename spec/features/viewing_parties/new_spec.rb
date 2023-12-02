require 'rails_helper'

RSpec.describe 'new viewing party page', type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu')
    @user_2 = User.create!(name: 'Kam Kennedy', email: 'kkennedy230@turing.edu')
  end
  it 'has a form to create a new viewing party', :vcr do
    visit user_discover_path(@user_1.id)
    click_button 'Find Top Rated Movies'
    click_on 'Pulp Fiction'
    click_button 'Create a Viewing Party'

    expect(page).to have_content('Pulp Fiction')
    expect(page).to have_field('party_duration', type: 'text')
    fill_in('party_duration', with: 170)

    expect(page).to have_field('time', type: 'time')
    fill_in('time', with: '20:00')
    expect(page).to have_content('kam kennedy')
    expect(page).to have_button('Create a Viewing Party')
    click_on('Create a Viewing Party')
    expect(current_path).to eq("/users/#{@user_1.id}")
  end

  it 'has a form to create a new viewing party', :vcr do
    visit user_discover_path(@user_1.id)
    click_button 'Find Top Rated Movies'
    click_on 'Pulp Fiction'
    click_button 'Create a Viewing Party'

    expect(page).to have_content('Pulp Fiction')
    expect(page).to have_field('party_duration', type: 'text')
    fill_in('party_duration', with: 170)

    expect(page).to have_field('time', type: 'time')
    fill_in('time', with: '20:00')
    expect(page).to have_content('kam kennedy')
    check('user_ids[]', match: :first)
    expect(page).to have_button('Create a Viewing Party')
    click_on('Create a Viewing Party')
    expect(current_path).to eq("/users/#{@user_1.id}")
  end
end
