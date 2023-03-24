class UserFacade
  attr_reader :user

  def initialize(params, viewing_party = nil)
    @user = User.find(params[:user_id])
  end

  def service
    MoviedbService.new
  end

  def hosted_parties
    @user.hosted_parties
  end

  def attended_parties
    @user.attended_parties
  end
end