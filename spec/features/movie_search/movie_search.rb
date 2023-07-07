require 'rails_helper'

RSpec.describe 'Movie Search' do
  describe 'movie search' do
    feature "user can search for movie" do
      scenario "user submits valid movie" do
        VCR.use_cassette("vcr_cassettes") do

          visit "users/user_id/discover"
          # select "Knights of the Zodiac", from: :title
          expect(page.status_code).to eq 200
        end
      end
    end
  end
end