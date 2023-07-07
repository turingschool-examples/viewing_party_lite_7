class MovieFacade
  attr_reader :search
  
  def initialize(search = nil)
    @search = search
  end

  def service 
    MovieService.new
  end
  
end