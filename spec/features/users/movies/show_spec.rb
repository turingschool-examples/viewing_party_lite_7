require 'rails_helper'

RSpec.describe 'User Story 10' do
  before(:each) do
    @stan = create(:user, id: 1)
    visit user_discover_index_path(@stan)
  end

  describe "User Story 8 - Movie Show Page" do
    xit "shows the movie information" do
      VCR.use_cassette(:movie_by_id_info, serialize_with: :json) do
        fill_in :search, with: "bat"
        click_button "Find Movies"

        expect(current_path).to eq("/users/#{@stan.id}/movies")
      end
    end
  end
end