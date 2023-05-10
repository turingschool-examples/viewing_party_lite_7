require 'rails_helper'

RSpec.describe 'discover users show page' do
  describe 'discover users show page' do
    let!(:user_1) { User.create!(name: "Angel Byun", email: "angelbyun@turing.edu") }
    let!(:user_2) { User.create!(name: "Isaac Thill", email: "isaacthill@turing.edu") }
    let!(:user_3) { User.create!(name: "Scott Le", email: "scottle@gmail.com") }
    let!(:user_4) { User.create!(name: "Megan Hinricher", email: "hinmeg@gmail.com") }

    it 'creates a button to the Discover Top Rated Movies' do
      visit "discover/users/#{user_1.id}"

      click_button("Discover Top Rated Movies")

      expect(current_path).to eq("/movies")
    end
  end
end