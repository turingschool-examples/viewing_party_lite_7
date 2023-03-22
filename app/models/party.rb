class Party < ApplicationRecord
	has_many :user_parties
	has_many :users, through: :user_parties

	# def movie
	# 	MovieFacade.new.movie_details(self.movie_id)
	# end

	def host
		user_id = user_parties.where(host: true).take.user_id
		User.find(user_id)
	end
end