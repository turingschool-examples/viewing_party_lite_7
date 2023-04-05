# frozen_string_literal: true

class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params)
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params)
  end
end
