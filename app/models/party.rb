class Party < ApplicationRecord
	has_many :user_parties
	has_many :users, through: :user_parties

	before_create :validate_runtime

	def host
		user_id = user_parties.where(host: true).take.user_id
		User.find(user_id)
	end

	private
	def validate_runtime
		if duration >= runtime
			return
		end
		# errors[:duration] << "Duration of Party cannot be shorter than Movie Runtime"
		errors.add(
			:base, 
			:duration, 
			message: "Duration of Party cannot be shorter than Movie Runtime"
		)
		throw :abort
	end
end