require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do
  before(:each) do
    @user1, @user2 = create(:user), create(:user)

    VCR.use_cassette('dashboard_movie_details') do
      @movies = MoviesFacade.new(nil).movies
        .map { |movie| MovieFacade.new(movie.id) }
    end

    @parties = @movies.map do |movie|
      Party.create!(host: @user1, title: movie.title, image_url: movie.image_url, duration: movie.runtime, datetime: DateTime.now + 40)
    end

    @parties.last.update!(host: @user2)
    @parties.last.reload

    @parties.each do |party|
      Partygoing.create!(user_id: @user1.id, party: party)
    end
  end

  it 'displays all parties user is connected to' do
    visit user_path(@user1)
    save_and_open_page

    within("#parties") do
      expect(page).to have_css(".party", count: 20)
      hosted_parties = all(".party").select { |party| party.has_content?("Hosting") }
      invited_parties = all(".party").select { |party| party.has_content?("Invited") }

      expect(hosted_parties.count).to eq(19)
      expect(invited_parties.count).to eq(1)
    end
  end
end
