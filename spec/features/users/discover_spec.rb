require 'rails_helper'

RSpec.describe 'discover movies' do
  before (:each) do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
    @user2 = User.create!(name: 'Paul', email: 'paul@turing.edu')
    @user3 = User.create!(name: 'Sooyung', email: 'sooyung@turing.edu')
  end
  it 'click find top rated movies' do
    visit discover_user_path(@user1.id)
    click_button "Find Top Rated Movies"
    expect(current_path).to eq(user_movies_path(@user1.id))
  end
  it 'should have a search button' do
    visit discover_user_path(@user1.id)
    expect(find_field('search').value).to eq(nil)
    click_button 'Find Movies'
    expect(current_path).to eq(user_movies_path(@user1.id))
  end
end