# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @facade = SearchFacade.new(params)
  end
end
