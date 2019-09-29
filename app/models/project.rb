class Project < ApplicationRecord
    belongs_to :customer
    has_many :offers, :dependent => :destroy
    has_many :programmers, through: :offers
end
