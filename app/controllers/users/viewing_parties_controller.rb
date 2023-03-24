class Users::ViewingPartiesController < ApplicationController

  def new
    @party = Party.new
  end
end