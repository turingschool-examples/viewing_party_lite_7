require 'rails_helper'

RSpec.describe 'discover movies' do
  before (:each) do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
  end

  it 'shows the top rated movies' do
    visit discover_user_path(@user2.id)
    click_button "Find Top Rated Movies"
  end

  it 'shows what you search for' do

  end
end