class Offer < ApplicationRecord
    belongs_to :programmer
    validates :programmer_id, presence: true

    belongs_to :project
    validates :project_id, presence: true
end
