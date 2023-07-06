# class Movie < ApplicationRecord
#   validates_presence_of :title,
#                         :genre,
#                         :summary,
#                         :cast,
#                         :reviews,
#                         :reviewers,
#                         :rating,
#                         :runtime
                    
#   validates_numericality_of :rating #less_than_or_equal_to: 10
#   validates_numericality_of :runtime
  
#   has_many :viewing_parties
#   has_many :viewing_users, through: :viewing_parties
# end
