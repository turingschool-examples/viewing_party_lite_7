require 'rails_helper'

RSpec.describe 'user dashboard page' do
  before :each do
    @user_1 = User.create!(name: 'Joe', email: 'joe@gmail.com')
  end
end

it "displays <user's name>'s Dashboard at the top of the page" do
  visit user_path(@user_1)

  expect(page).to have_content("#{@user_1.name}'s Dashboard")
end

it 'has a button to discover movies' do
  visit user_path(@user_1)

  expect(page).to have_button('Discover Movies')
end

# This test needs to be updated when viewing parties are implemented
it "lists the user's viewing parties" do
  visit user_path(@user_1)

  expect(page).to have_content('Viewing Parties:')
end
