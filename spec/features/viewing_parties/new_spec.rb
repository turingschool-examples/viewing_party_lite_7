require "rails_helper"

RSpec.describe "New Viewing Party" do
  before(:each) do
    @user_1 = User.create!(name: 'Jimmy', email: 'movie_buff333@gmail.com')
    @user_2 = User.create!(name: 'Timmy', email: 'i_hate_movies@gmail.com')
    @user_3 = User.create!(name: 'Tammy', email: 'gamer4134@gmail.com')

    @movie = Movie.new({ 
      id: 321,
      original_title: "Mambo Italiano",
      vote_average: 5.8,
      runtime: 89,
      genres: [{:id=>35, :name=>"Comedy"}, {:id=>10749, :name=>"Romance"}],
      overview: "When an Italian man comes out of the closet, it affects both his life and his crazy family."
    })
  end

  describe "When I visit the new viewing party page" do
    it "displays a form to create a new viewing party", :vcr do
      visit new_party_path(@user_1.id, @movie.id)
      expect(page).to have_content("Mambo Italiano")

      fill_in :duration, with: @movie.runtime
      fill_in :when, with: Date.today
      fill_in :start_time, with: Time.now
      check("#{@user_1.name} (#{@user_1.email})")
      check("#{@user_2.name} (#{@user_2.email})")
      click_button "Create Party"

      expect(current_path).to eq(dashboard_path(@user_1.id))
    end
  end
end