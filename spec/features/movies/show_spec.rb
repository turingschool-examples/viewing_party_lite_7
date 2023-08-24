require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:each) do
    @user_1 = User.create!(name: 'Jimmy', email: 'movie_buff333@gmail.com')
    @user_2 = User.create!(name: 'Timmy', email: 'i_hate_movies@gmail.com')
    @user_3 = User.create!(name: 'Tammy', email: 'gamer4134@gmail.com')
  end
  describe 'When I visit a movie show page' do
    it "I see a button to create a viewing party" do
      visit movie_path(@user_1.id, 104)

      expect(page).to have_button("Create a Viewing Party")
      click_button("Create Viewing Party")

      expect(current_path).to eq(new_party_path(@user_1.id, 104))
    end
  end
end