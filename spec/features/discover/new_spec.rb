# frozen_string_literal: true

require "rails_helper"

RSpec.describe type: :feature do
  describe "As a visitor" do
    describe "When I visit the '/users/:id/discover' path" do
      let!(:zoidberg) { User.create!(name: "Zoidberg", email: "doc_z_berg@gmail.com") }
      before :each do
        visit "/users/#{zoidberg.id}/discover"
      end
      it "displays a button to discover top rated movies" do
        expect(page).to have_button("Discover Top Rated Movies")
        # add redirect to this when api is consumed
      end

      it "displays a form to enter keywords to search by movie title" do
        expect(page).to have_field("title")
        # add redirect to this when api is consumed
      end
    end
  end
end
