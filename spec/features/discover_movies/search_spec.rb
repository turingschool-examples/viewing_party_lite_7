require 'rails_helper'

RSpec.describe 'Discover movies page' do
  before :each do
    @user_1 = User.create!(name: "User1", email: "email1@example.com")
  end

  describe 'Discover movies' do
    it 'has search options' do
      visit "/users/#{@user_1.id}/discover"
      
    end
  end
end