class Project < ApplicationRecord
    belongs_to :customer
    has_many :offers
    has_many :programmers, through: :offers
end
