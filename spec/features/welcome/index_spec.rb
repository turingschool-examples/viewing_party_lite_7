require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  describe "#index" do
    it "displays the title of the application" do
      visit root_path

      expect(page).to have_content("Viewing Party!")
    end
  end
end