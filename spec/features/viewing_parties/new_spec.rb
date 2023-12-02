require 'rails_helper'

RSpec.describe 'New Viewing Party Page (/users/:user_id/movies/:movid_id/viewing-party/new)' do
  describe 'visiting the new viewing party page' do
    it 'displays a form to create a new viewing party' do
      kam = User.create!(name: "Kam", email: "doofus23@gmail.com")
      visit "/users/#{kam.id}/movies/872585/viewing_party/new"
      expect(page).to have_field(:duration)
      expect(page).to have_field(:when)
      expect(page).to have_field(:start_time)
      expect(page).to have_section('users')
      expect(page).to have_button('Create Party')
    end
  end
end
