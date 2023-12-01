require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before(:each) do
    load_test_data
  end

  describe '#current_user' do
    it 'returns the current user based on the session user_id' do
      session[:user_id] = @user1.id
      expect(controller.current_user).to eq(@user1)
    end

    it 'returns nil when there is no session user_id' do
      session[:user_id] = nil
      expect(controller.current_user).to be_nil
    end
  end
end