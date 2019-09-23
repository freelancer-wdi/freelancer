class Portfolio < ApplicationRecord
    belongs_to :programmer
    validates_uniqueness_of :programmer_id, :message => "programmer can only        
                                     have one Portfolio"
    validates :programmer_id, presence: true
end
