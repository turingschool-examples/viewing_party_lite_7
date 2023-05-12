class UserPartiesController < ApplicationController
  def create
    UserPartyFacade.create_parties(users)
  end
end