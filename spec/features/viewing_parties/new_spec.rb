require 'rails_helper'

RSpec.describe 'new viewing party page', type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Joseph Lee', email: 'jlee230@turing.edu')
    @user_2 = User.create!(name: 'Kam Kennedy', email: 'kkennedy230@turing.edu')
  end
  VCR.use_cassette('Pulp Fiction') do
    it 'has a form to create a new viewing party' do
      visit "/users/#{@user_1.id}/movies/680/viewing-party/new"

      expect(page).to have_content('Pulp Fiction')
      expect(page).to have_field('viewing_party[duration]', type: 'text')
      expect(page).to have_field('viewing_party[date]', type: 'date')
      expect(page).to have_checkbox('Kam Kennedy')
      expect(page).to have_button('Create a Party')
    end
  end
end
