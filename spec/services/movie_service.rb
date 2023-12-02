require 'rails_helper'

describe MovieService do
  describe "class methods" do
    before(:each) do
      @user = User.create(name: "Joseph", email: "jlee230@turing.edu")
    end
  end
end