# frozen_string_literal: true

# app/controllers/welcome_controller.rb
class WelcomeController < ApplicationController
  def index
    @users = User.all
  end
end
