class ViewingPartyController < ApplicationController
  def new
    @facade = ViewingPartyFacade.new(params)
  end
end