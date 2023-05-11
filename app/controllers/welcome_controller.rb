# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @users = User.all
    # require 'pry'; binding.pry
  end
end
