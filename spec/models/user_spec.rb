require 'rails_helper'

RSpec.describe User do
  before do
  end
  
  it 'creates a user' do
    user_1 = create(:user)

    require 'pry'; binding.pry
    expect(user_1).to be_a(User)
  end
end