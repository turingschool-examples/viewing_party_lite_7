require 'rails_helper'

RSpec.describe '#show', type: :feature do
before :each do
  @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
  @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
  @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
end
  it 'shows the name of the user next to dashboard' do
    visit "users/#{@user1.id}"

    expect(page).to have_content("#{@user1.name}'s Dashboard")  
  end
  it 'has a discover movies button' do
    visit "users/#{@user1.id}"

    expect(page).to have_button('Discover Movies')  
  end
  it 'has a viewing party list' do
    visit "users/#{@user1.id}"

    expect(page).to have_content("Viewing Parties")  
  end
end