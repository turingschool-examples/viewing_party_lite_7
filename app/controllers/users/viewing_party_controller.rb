class Users::ViewingPartyController < ApplicationController
  def new
    @movie = MovieFacade.new(params).search
  end
end