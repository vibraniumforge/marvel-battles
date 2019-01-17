class Battle < ActiveRecord::Base

    belongs_to :movie
    belongs_to :character
    
    validates :name, presence: true
    validates :location, presence: true

    def self.first_five
        all.limit(5)
    end
  

end
