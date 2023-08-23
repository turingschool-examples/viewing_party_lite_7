require 'rails_helper'

RSpec.describe "users movies show page" do
  before do
    @user_1 = User.create!(name: "Ringo", email: "ringo@gmail.com")
    @movie = Movie.create!(name: "Batman", )

    visit user_movie_path(@user_1)
  end