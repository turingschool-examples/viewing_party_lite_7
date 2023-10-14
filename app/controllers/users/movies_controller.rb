# frozen_string_literal: true

module Users
  class MoviesController < ApplicationController
    def index
      @facade = MoviesFacade.new(params)
    end

    def show
      @facade = MoviesFacade.new(params)
    end
  end
end
