class ViewingPartiesController <ApplicationController
  def new
    @users = User.all.where.not(id: params[:user_id])

    @user = User.find(params[:user_id])

    facade = UserFacade.new(nil, nil)
    facade.get_movie_details(params[:movie_id])
    @movie = facade.details
  end

  def create
    user = User.find(params[:user_id])
    viewing_party = ViewingParty.new(party_params)

    if viewing_party.save
      viewing_party.viewing_party_users.create!(user_id: params[:user_id]).update(is_host: true)
    
      users = params[:users].find_all do |num|
        num != "0" &&  num != params[:user_id]
      end
    
      users.each do |user_id|
        viewing_party_user = viewing_party.viewing_party_users.create!(user_id: user_id)
      end
      
      redirect_to user_path(user)
    else
      flash[:error] = "Error: Invalid form entry"
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    end
  end

  private
    def party_params
      params.permit(:duration_of_party, :when, :start_time)
    end
end