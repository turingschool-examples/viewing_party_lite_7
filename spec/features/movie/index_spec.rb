require 'rails_helper'

RSpec.describe "Movie Index" do
  before :each do
    @user = User.create(name: "Jimothy Johnson", email: "jimothymail@jimothymail.com")
    visit movie_index_path(@user)
  end
  it 'visits page' do
    expect(current_path).to eq(movie_index_path(@user))
  end
end