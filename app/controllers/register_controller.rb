# frozen_string_literal: true

class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create; end
end
