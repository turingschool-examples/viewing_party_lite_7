class TvFacade
  def initialize(tv_id)
    @tv_id = tv_id
  end

  def tv_show
    @_tv_show ||= Tv.new(service.tv_details(@tv_id))
  end

  private

  def service
    @_service ||= TvService.new
  end
end