require 'rails_helper'

RSpec.describe "register page" do
  it "can successfully register a new user" do
    visit "/register"

    fill_in "Name:", with: "Amy" 
    fill_in "Email:", with: "amy@turing.edu"

    click_button "Create New User"
    
    expect(current_path).to eq(user_path(User.last))
  end
end