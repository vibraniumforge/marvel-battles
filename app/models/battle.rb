class Battle < ApplicationRecord
    belongs_to :movie
    belongs_to :battle

    validates :location, presence: true
    
end
