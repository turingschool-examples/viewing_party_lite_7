require 'rails_helper'

RSpec.describe 'New Party Page', :vcr do
  before :each do
    @user_1 = User.create!(name: 'Billy Bob Thornton', email: 'billybob@turing.edu')
    @user_2 = User.create!(name: 'Sandra Bullock', email: 'sandy@turing.edu')
    @user_3 = User.create!(name: 'Tom Hanks', email: 'tom@turing.edu')
    @user_4 = User.create!(name: 'Will Smith', email: 'will@turing.edu')
    visit new_user_movie_party_path(@user_1, 278)
  end
  describe 'as a registered user, when I visit the new party page' do
    it 'I see a button back to the discover page' do
      expect(page).to have_button('Discover Page')
      click_button 'Discover Page'
      expect(current_path).to eq(user_discover_index_path(@user_1))
    end
  end
end