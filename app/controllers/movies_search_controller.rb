# frozen_string_literal: true

class MoviesSearchController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
end
