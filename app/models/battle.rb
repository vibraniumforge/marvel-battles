class Battle < ApplicationRecord

    belongs_to :movie
    belongs_to :battle

    validates :name, presence: true
    validates :location, presence: true

    
end
