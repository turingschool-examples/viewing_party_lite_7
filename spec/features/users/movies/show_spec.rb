require 'rails_helper'

RSpec.describe "User's Movie Show page" do
  before(:each) do
    @user1 = User.create!(name: 'John Smith', email: 'jsmith@aol.com')
    @movie1 = MovieFacade.new({title: 'Rebel Without a Cause'}).search.first

    visit user_movie_path(@user1, @movie1.id)
  end

  xit "has a button to return to the Discover Page" do
    expect(page).to have_button('Discover Page')
    click_button('Discover Page')
    expect(current_path).to eq(user_discover_path(@user1))
  end

  it "has a button to create a viewing party" do
    expect(page).to have_button("Create Viewing Party for #{@movie1.title}")
    click_button("Create Viewing Party for #{@movie1.title}")
    expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie1.id}/viewing_party/new")
  end
end