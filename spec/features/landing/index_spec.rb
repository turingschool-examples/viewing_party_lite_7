require 'rails_helper'

RSpec.describe "landing page" do
  before do
    @user_1 = User.create!(name: "Bob", email: "bob@gmail.com")
    @user_2 = User.create!(name: "Jane", email: "jane@gmail.com")
    @user_3 = User.create!(name: "Tom", email: "tom@gmail.com")

    visit "/"
  end
end
