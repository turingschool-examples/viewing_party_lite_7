# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    if save
      redirect_to user_path
    end
  end

  def create; end
end
