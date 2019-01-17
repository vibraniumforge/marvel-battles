class Battle < ActiveRecord::Base

    belongs_to :movie
    belongs_to :character
    
    validates :name, presence: true
    validates :location, presence: true

end
