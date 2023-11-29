require 'rails_helper'

RSpec.describe 'discover movies' do
  before (:each) do
    @user1 = User.create!(name: 'Brendan', email: 'brendan@turing.edu')
  end
  it 'should have a top movies button' do
    visit discover_user_path(@user1.id)
    expect(page).to have_button("Top Movies")
    expect(current_path).to eq("users/#{@user1.id}/movies")
  end
  it 'should have a search button' do

  end
end